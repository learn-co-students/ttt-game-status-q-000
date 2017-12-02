require 'learn_web/client/request'
require 'learn_web/client/connection'
require 'learn_web/client/user'
require 'learn_web/client/pull_request'
require 'learn_web/client/lesson'
require 'learn_web/client/validate_repo'
require 'learn_web/client/fork'
require 'learn_web/client/environment'

module LearnWeb
  class Client
    attr_reader :token, :conn, :silent_output

    LEARN_URL = 'https://learn.co'
    API_ROOT  = '/api/v1'

    include LearnWeb::Client::Request
    include LearnWeb::Client::Connection
    include LearnWeb::Client::PullRequest
    include LearnWeb::Client::Lesson
    include LearnWeb::Client::ValidateRepo
    include LearnWeb::Client::Fork
    include LearnWeb::Client::User
    include LearnWeb::Client::Environment

    def initialize(token:, silent_output: false)
      @token = token
      @silent_output = silent_output
      @conn = Faraday.new(url: LEARN_URL) do |faraday|
        faraday.adapter Faraday.default_adapter
      end
    end

    def valid_token?
      !!me.data
    end
  end
end
