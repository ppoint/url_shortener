source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.5"

gem "sinatra"
gem "sinatra-contrib"
gem "rackup"
gem "puma"
gem "sqlite3"

group :development, :test do
  gem "rerun"
  gem "rspec"
  gem "rack-test"
  gem "debug"
end


# Standard library deprecation warnings
gem "ostruct"
gem "logger"