require_relative 'spec_helper'

HEADERS = { 'CONTENT_TYPE' => 'application/json' }


def app
  Sinatra::Application
end

RSpec.describe 'POST /encode' do

  context "receives JSON with 'url' as the only required parameter" do
    it "converts 'url' to a short-url" do
      post '/'
    end

  end

  context "receives JSON, but required parameter is missing" do
    it "produces a HTTP 400 'Bad Request' message" do
      payload = { foo: 'bar' }.to_json

      post '/encode', payload, HEADERS

      expect(last_response.status).to eq(400)
      response_body = JSON.parse(last_response.body)
      expect(response_body['error']).to eq("POST is missing JSON field 'url'")
    end

  end
end

RSpec.describe 'unsupported endpoints' do
  it "handles any request to endpoints that aren't recognized" do
    get '/'
    expect(last_response).to be_not_found
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
