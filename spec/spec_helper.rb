require 'simplecov'
SimpleCov.start

require 'growl_car'
require 'rspec'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow: 'coveralls.io')