require 'learn_status/report/formatter'

module LearnStatus
  class Report
    attr_reader   :client
    attr_accessor :status

    def initialize
      _login, token = Netrc.read['learn-config']
      @client       = LearnWeb::Client.new(token: token)
    end

    def self.generate
      new.generate
    end

    def generate
      get_status
      generate_report
    end

    private

    def get_status
      puts 'Getting current status...'
      self.status = client.current_status
    end

    def generate_report
      formatted_report = LearnStatus::Report::Formatter.new(status).execute
      puts formatted_report.printable_output
    end
  end
end
