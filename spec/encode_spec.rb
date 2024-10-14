ENV['APP_ENV'] = 'test'

require 'url_shortener'
require 'rspec'
require 'rack/test'

RSpec.describe '/encode' do
  it "receives" do
    expect(false).to be_true
  end
end
