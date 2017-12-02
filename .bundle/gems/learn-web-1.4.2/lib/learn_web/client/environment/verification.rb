module LearnWeb
  class Client
    module Environment
      class Verification
        attr_reader   :response
        attr_accessor :message, :status

        def initialize(response)
          @response = response

          parse!
        end

        def success?
          status == 200
        end

        private

        def parse!
          self.status = response.status

          begin
            body = Oj.load(response.body, symbol_keys: true)
            self.message = body[:message]
          rescue
            self.message = 'Sorry, something went wrong. Please try again.'
          end
        end
      end
    end
  end
end
