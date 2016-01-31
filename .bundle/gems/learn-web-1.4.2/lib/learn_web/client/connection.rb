module LearnWeb
  class Client
    module Connection
      def get(url, options = {})
        request :get, url, options
      end

      def post(url, options = {})
        request :post, url, options
      end
    end
  end
end
