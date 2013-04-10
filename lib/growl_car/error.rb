module GrowlCar
  module Error
    ConfigurationError = Class.new(::StandardError)
    UnauthorizedError = Class.new(::StandardError)
    HttpError = Class.new(::StandardError)
  end
end