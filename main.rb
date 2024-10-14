#!/usr/bin/env ruby

require 'bundler/setup'
$LOAD_PATH.unshift(File.expand_path('lib', __dir__))
require "url_shortener"

run Sinatra