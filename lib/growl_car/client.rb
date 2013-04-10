require "growl_car/configuration"
require "growl_car/request"
require "growl_car/growl_notification"

module GrowlCar
  class Client
    include GrowlCar::Request
    include GrowlCar::GrowlNotification

    # Initialize a new GrowlCar::Client
    #
    # @param options [Hash]
    # @return [GrowlCar::Client]
    def initialize(options={})
      GrowlCar::Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key])
      end

      super()

      set_auth(@username, @password)
    end

    
  end
end