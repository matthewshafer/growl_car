module GrowlCar
  module GrowlNotification

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