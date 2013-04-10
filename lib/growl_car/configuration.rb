module GrowlCar
  module Configuration
    attr_writer :username, :password

    class << self

      # List of keys used for configuration
      #
      # @return [Array]
      def keys
        @keys ||= [
          :username,
          :password
        ]
      end

      # Url for boxcar.io
      #
      # @return [String]
      def boxcar_url
        "https://boxcar.io/notifications"
      end
    end

    # Convenience method to allow GrowlCar configuration to be set in a block
    #
    # @raise [GrowlCar::Error::ConfigurationError] if credentials are not in the form of a string
    def configure
      yield self
      validate_credentials!
      self
    end

    # Set all configuration values to nil
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