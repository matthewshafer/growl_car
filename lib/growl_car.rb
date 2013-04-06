require "growl_car/version"
require "growl_car/configuration"
require "growl_car/client"
require 'Atomic'

module GrowlCar

  @client = ::Atomic.new

  class << self
    include Configuration

    def client
      create_client unless @client.value
      @client.value
    end

    def respond_to?(method)
      return client.respond_to?(method)
    end

    private

      def method_missing(method_name, *args, &block)
        return super unless client.respond_to?(method_name)
        client.send(method_name, *args, &block)
      end

      def create_client
        begin
          @client.try_update { GrowlCar::Client.new(credentials) }
        rescue Atomic::ConcurrentUpdateError

        end
      end
  end
end
