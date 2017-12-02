module LearnHello
  class Greeting
    attr_reader   :client
    attr_accessor :result

    def initialize
      _login, token = Netrc.read['learn-config']
      @client       = LearnWeb::Client.new(token: token)
    end

    def self.execute
      new.execute
    end

    def execute
      introduce
      output_result
    end

    private

    def introduce
      self.result = client.verify_environment
    end

    def output_result
      if result.success?
        puts result.message
      elsif result.message.match(/coming soon/) || result.message.match(/verified your email/)
        puts result.message
      else
        puts "Sorry, it looks like something went wrong. Please get in touch so we can help."
      end
    end
  end
end
