# spec/spec_helper.rb
require 'rack/test'
require 'rspec'
require_relative '../lib/url_shortener'

ENV['APP_ENV'] = 'test'

# Include Rack::Test methods in all RSpec examples
RSpec.configure do |config|
  config.include Rack::Test::Methods
end
