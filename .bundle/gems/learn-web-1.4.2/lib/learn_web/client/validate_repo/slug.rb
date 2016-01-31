module LearnWeb
  class Client
    module ValidateRepo
      class Slug
        attr_accessor :data, :repo_slug, :lab, :lesson_id, :later_lesson
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
            populate_attributes!
          when 401
            puts "It seems your OAuth token is incorrect. Please re-run config with: learn reset"
            exit
          when 422
            begin
              self.data = Oj.load(response.body, symbol_keys: true)
              if data[:message].match(/Cannot find lesson/)
                puts "Hmm...#{data[:message]}. Please check your input and try again."
                exit
              else
                puts "Sorry, something went wrong. Please try again."
                exit
              end
            rescue
              puts "Sorry, something went wrong. Please try again."
              exit
            end
          when 500
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
