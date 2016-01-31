module LearnWeb
  class Client
    module Fork
      class Request
        attr_reader   :response
        attr_accessor :message, :status

        def initialize(response)
          @response = response

          parse!
        end

        private

        def parse!
          self.status = response.status

          begin
            body = Oj.load(response.body, symbol_keys: true)
            self.message = body[:message]

            if self.message && self.message.match(/verified your email/)
              abort self.message
            end
          rescue
            self.message = 'Sorry, something went wrong. Please try again.'
          end
        end
      end
    end
  end
end
