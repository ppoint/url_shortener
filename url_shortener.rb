#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/json'
require 'json'

post '/encode' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  if (data['url'])
    result = {
      :url => data['url'],
      :short_url => 'asdf',
    }
    json result
  else
    json :error => "POST is missing JSON field 'url'"
  end
end

post '/decode' do
  json :error => "not implemented yet"
end

get '/' do
  json :error => "route not implemented - URL Shortener service"
end