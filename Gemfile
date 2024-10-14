source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.5"

require "bundler/setup"

gem "sinatra"
gem "sinatra-contrib"
gem "rackup"
gem "puma"

group :development, :test do
  gem "rerun"
  gem "rspec"
  gem "rack-test"
end


# Standard library deprecation warnings
gem "ostruct"
gem "logger"