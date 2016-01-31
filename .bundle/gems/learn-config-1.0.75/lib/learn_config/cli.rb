module LearnConfig
  class CLI
    attr_reader   :github_username
    attr_accessor :token

    def initialize(github_username)
      @github_username = github_username
    end

    def ask_for_oauth_token(short_text: false, retries_remaining: 5)
      if !short_text
        puts <<-LONG
To connect with the Learn web application, you will need to configure
the Learn gem with an OAuth token. You can find yours at the bottom of your profile
page at: https://learn.co/#{github_username ? github_username : 'your-github-username'}.

        LONG

        print 'Once you have it, please come back here and paste it in: '
      elsif retries_remaining > 0
        print "Hmm...that token doesn't seem to be correct. Please try again: "
      else
        puts "Sorry, you've tried too many times. Please check your token and try again later."
        exit
      end

      self.token = gets.chomp

      verify_token_or_ask_again!(retries_remaining: retries_remaining)
    end

    private

    def verify_token_or_ask_again!(retries_remaining:)
      if token_valid?
        token
      else
        ask_for_oauth_token(short_text: true, retries_remaining: retries_remaining - 1)
      end
    end

    def token_valid?(retries=3)
      learn = LearnWeb::Client.new(token: token, silent_output: true)
      begin
        Timeout::timeout(15) do
          learn.valid_token?
        end
      rescue Timeout::Error
        if retries > 0
          puts "There was an error validating your token. Retrying..."
          token_valid?(retries-1)
        else
          puts "There was a problem connecting to Learn. Please try again."
          exit
        end
      end
    end
  end
end
