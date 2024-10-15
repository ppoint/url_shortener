require_relative 'spec_helper'

def app
  Sinatra::Application
end

RSpec.describe 'POST /encode' do

  it "receives" do
    expect(false).to be_true
  end

end

RSpec.describe 'unsupported endpoints' do
  it "handles any request to endpoints that aren't recognized" do
    get '/'
    expect(last_response).not_to be_ok
  end

  it "doesn't support GET /encode" do
    get '/encode'
    expect(last_response).not_to be_ok
  end

  it "doesn't support GET /decode" do
    get '/decode'
    expect(last_response).not_to be_ok
  end
end
