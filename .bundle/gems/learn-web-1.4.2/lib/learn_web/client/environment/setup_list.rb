module LearnWeb
  class Client
    module Environment
      class SetupList
        attr_accessor :data, :steps
        attr_reader   :response

        include AttributePopulatable

        def initialize(response)
          @response = response

          parse!
        end

        private

        def parse!
          case response.status
          when 200
            self.data = Oj.load(response.body, symbol_keys: true)
            self.steps = self.data
          when 422, 500
            puts "Sorry, something went wrong. Please try again."
            exit
          else
            puts "Sorry, something went wrong. Please try again."
            exit
          end
        end
      end
    end
  end
end
