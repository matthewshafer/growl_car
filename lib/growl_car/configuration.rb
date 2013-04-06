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
    end

    def configure
      yield self
      validate_credentials!
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
            raise ConfigurationError, "Invalid #{credential}. Must be a string"
          end
        end
      end
  end
end