require 'learn_web/client/user/me'

module LearnWeb
  class Client
    module User
      def me_endpoint
        "#{API_ROOT}/users/me"
      end

      def me
        response = get(
          me_endpoint,
          headers: { 'Authorization' => "Bearer #{token}" }
        )

        LearnWeb::Client::User::Me.new(response, silent_output: silent_output)
      end
    end
  end
end
