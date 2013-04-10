require 'httpclient'

module GrowlCar
  module Request

    # Initialize HTTPClient for requests
    def initialize
      @http = HTTPClient.new
    end

    private

      def post_notification(query)
        raise_if_status_not_ok(@http.post(GrowlCar::Configuration.boxcar_url, query).status)
      end

      def raise_if_status_not_ok(status)
        case status
        when 200
          true
        when 401
          raise GrowlCar::Error::UnauthorizedError
        else
          raise GrowlCar::Error::HttpError
        end
      end

      def set_auth(username, password)
        @http.set_auth(GrowlCar::Configuration.boxcar_url, username, password)
      end
  end
end