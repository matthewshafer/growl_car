module GrowlCar
  module GrowlNotification

    # Sends a notification to the boxcar.io growl provider
    # 
    # @param from [String] name of the sender of the message
    # @param message [String] message to be sent to boxcar
    # @raise [GrowlCar::Error::UnauthorizedError] if username or password is incorrect
    # @raise [GrowlCar::Error::HttpError] if http response is not 200 or 401
    # @return [Boolean] on successful notification
    def send_growl_notification(from, message)
      boxcar_post_fields = {
        "notification[from_screen_name]" => from,
        "notification[message]" => message,
        "notification[from_remote_service_id]" => random_growl_number
      }

      post_notification(boxcar_post_fields)
    end

    private

      def random_growl_number
        Random.rand(9999999999)
      end
  end
end