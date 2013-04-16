require "growl_car/version"
require "growl_car/configuration"
require "growl_car/client"
require "growl_car/error"
require 'atomic'

module GrowlCar

  @client = ::Atomic.new

  class << self
    include Configuration

    def client
      @client.compare_and_swap(nil, GrowlCar::Client.new(credentials)) unless @client.value
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
  end
end
