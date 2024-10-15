require 'sinatra'
require 'sinatra/json'
require 'json'
require 'sqlite3'

BASE_SHORT_URL = "http://ex.eg"

post '/encode' do
  content_type :json

  data = JSON.parse(request.body.read)
  if (data['url'])
    short_url = make_short_url(data['url'])
    result = {
      :url => data['url'],
      :short_url => short_url,
    }
    # @TODO when we add DB component, we'll need to handle cases where a URL has already been shortened
    json result
  else
    status 400
    { error: "POST is missing JSON field 'url'" }.to_json
  end
end

post '/decode' do
  json :error => "not implemented yet"
end

def make_short_url(url)
  "#{BASE_SHORT_URL}/"
end