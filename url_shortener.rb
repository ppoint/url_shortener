#!/usr/bin/env ruby

require 'sinatra'

post '/encode' do
  request.body.rewind
  data = JSON.parse(request.body.read)
  if (data['url'])
    asdf
  else
    error
  end
end

post '/decode' do
  asdf
end

get '/' do
  error "route not implemented - URL Shortener service"
end