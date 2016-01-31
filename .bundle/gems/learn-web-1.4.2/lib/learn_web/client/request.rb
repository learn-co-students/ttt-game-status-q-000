module LearnWeb
  class Client
    module Request

      private

      def request(method, url, options = {})
        begin
          @conn.send(method) do |req|
            req.url url
            build_request(req, options)
          end
        rescue Faraday::ConnectionFailed
          puts "Connection error. Please try again."
        end
      end

      def build_request(request, options)
        build_headers(request, options[:headers])
        build_params(request, options[:params])
      end

      def build_headers(request, headers)
        if headers
          headers.each do |header, value|
            request.headers[header] = value
          end
        end
      end

      def build_params(request, params)
        if params
          params.each do |param, value|
            request.params[param] = value
          end
        end
      end
    end
  end
end
