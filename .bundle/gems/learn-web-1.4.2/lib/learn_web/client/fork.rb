require 'learn_web/client/fork/request'

module LearnWeb
  class Client
    module Fork
      def fork_endpoint
        "#{API_ROOT}/fork_requests"
      end

      def fork_repo(repo_name:)
        response = post(
          fork_endpoint,
          headers: { 'Authorization' => "Bearer #{token}" },
          params: { 'repo_name' => repo_name }
        )

        LearnWeb::Client::Fork::Request.new(response)
      end
    end
  end
end
