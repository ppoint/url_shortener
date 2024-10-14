# config.ru

require 'bundler'
Bundler.require

require './lib/url_shortener'
run Sinatra::Application
