ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'

require_relative '../lib/url_shortener'

DB_TESTFILE = 'db/test.sqlite3'

# Include Rack::Test methods in all RSpec examples
RSpec.configure do |config|
  config.include Rack::Test::Methods

  def app
    # I think that 'app' is the name that's expected by Rack.
    Sinatra::Application
  end

  config.after(:suite) do
    File.delete(DB_TESTFILE) if File.exist?(DB_TESTFILE)
  end
end
