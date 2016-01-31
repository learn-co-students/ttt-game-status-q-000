require 'learn_web/client/validate_repo/slug'

module LearnWeb
  class Client
    module ValidateRepo
      def validate_repo_slug_endpoint
        "#{API_ROOT}/repo_slug_validations"
      end

      def validate_repo_slug(repo_slug:)
        response = post(
          validate_repo_slug_endpoint,
          headers: { 'Authorization' => "Bearer #{token}" },
          params: { 'repo_slug' => repo_slug }
        )

        LearnWeb::Client::ValidateRepo::Slug.new(response)
      end
    end
  end
end
