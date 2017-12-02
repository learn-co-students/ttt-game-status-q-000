require 'learn_web/client/environment/setup_list'
require 'learn_web/client/environment/verification'

module LearnWeb
  class Client
    module Environment
      def environment_setup_list_endpoint
        "#{API_ROOT}/environmentalizer/steps"
      end

      def verification_endpoint
        "#{API_ROOT}/gem_verifications"
      end

      def environment_setup_list
        response = get(environment_setup_list_endpoint)

        LearnWeb::Client::Environment::SetupList.new(response)
      end

      def verify_environment
        response = post(
          verification_endpoint,
          headers: { 'Authorization' => "Bearer #{token}" }
        )

        LearnWeb::Client::Environment::Verification.new(response)
      end
    end
  end
end
