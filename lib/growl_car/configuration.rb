module GrowlCar
  module Configuration
    attr_writer :username, :password

    class << self
      def keys
        @keys ||= [
          :username,
          :password
        ]
      end

      def boxcar_url
        "https://boxcar.io/notifications"
      end
    end

    def configure
      yield self
      validate_credentials!
      self
    end

    def reset!
      GrowlCar::Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", nil)
      end
    end

    private

      def credentials
        {
          :username => @username,
          :password => @password
        }
      end

      def validate_credentials!
        credentials.each do |credential, value|
          unless value.is_a?(String)
            raise GrowlCar::Error::ConfigurationError, "Invalid #{credential}. Must be a string"
          end
        end
      end
  end
end