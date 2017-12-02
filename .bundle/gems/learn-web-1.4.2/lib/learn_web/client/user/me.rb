module LearnWeb
  class Client
    module User
      class Me
        attr_accessor :response, :id, :first_name, :last_name, :full_name,
                      :username, :email, :github_gravatar, :github_uid, :data,
                      :silent_output

        include LearnWeb::AttributePopulatable

        def initialize(response, silent_output: false)
          @response      = response
          @silent_output = silent_output

          parse!
        end

        def parse!
          if response.status == 200
            self.data = Oj.load(response.body, symbol_keys: true)

            populate_attributes!
          elsif silent_output == false
            case response.status
            when 401
              puts "It seems your OAuth token is incorrect. Please re-run config with: learn reset"
              exit 1
            when 500
              puts "Something went wrong. Please try again."
              exit 1
            else
              puts "Something went wrong. Please try again."
              exit 1
            end
          end

          self
        end
      end
    end
  end
end
