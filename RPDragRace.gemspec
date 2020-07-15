
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "RPDragRace/version"

Gem::Specification.new do |spec|
  spec.name          = "RPDragRace"
  spec.version       = RPDragRace::VERSION
  spec.summary       = "A beginners CLI project"
  spec.description   = "Provides details about your favorite queens"
  spec.authors       = ["'Jared Harbison'"]
  spec.email         = ["'jared.harbison@gmail.com'"]
  spec.homepage      = 'http://rubygems.org/gems/RPDragRace'
  spec.license       = "MIT"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
