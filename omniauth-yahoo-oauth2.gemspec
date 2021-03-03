# frozen_string_literal: true

require File.expand_path(
  File.join("..", "lib", "omniauth", "yahoo_oauth2", "version"),
  __FILE__
)

Gem::Specification.new do |gem|
  gem.name          = "omniauth-yahoo-oauth2"
  gem.version       = OmniAuth::YahooOauth2::VERSION
  gem.license       = "MIT"
  gem.summary       = %(A Yahoo OAuth2 strategy for OmniAuth 1.x)
  gem.description   = %(A OAuth strategy based on omniauth-oauth2, allowing you to login to Yahoo.)
  gem.authors       = ["David Svensson"]

  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 2.4"

  gem.add_runtime_dependency "omniauth", "~> 2.0"
  gem.add_runtime_dependency "omniauth-oauth2", ">= 1.3"

  gem.add_development_dependency "rubocop", "~> 0.55"
end
