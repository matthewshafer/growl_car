require 'cgi'
require "growl_car/configuration"

module GrowlCar
  class Client

    def initialize(options={})
      GrowlCar::Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key])
      end
    end

    
  end
end