# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'growl_car/version'

Gem::Specification.new do |spec|
  spec.name          = "growl_car"
  spec.version       = GrowlCar::VERSION
  spec.authors       = ["Matthew Shafer"]
  spec.email         = ["matthewshafer@mac.com"]
  spec.description   = %q{Sending growl notifications to boxcar.io}
  spec.summary       = %q{A tool to allow sending notifications to the growl provider on boxcar.io}
  spec.homepage      = "https://github.com/matthewshafer/growl_car"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13.0"
  spec.add_development_dependency "pry", "~> 0.9.12"
  spec.add_development_dependency "webmock", "~> 1.11.0"
  spec.add_development_dependency "simplecov", "~> 0.7.1"

  spec.add_dependency "atomic", "~> 1.1.0"
end
