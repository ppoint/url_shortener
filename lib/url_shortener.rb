require 'sinatra'
require 'sinatra/json'
require 'json'
require 'sqlite3'

BASE_SHORT_URL = "http://ex.eg"
ENV['RACK_ENV'] ||= 'development'
DB_FILENAME = "db/#{ENV['RACK_ENV']}.sqlite3"
DB_SCHEMA = 'db/schema.sql'



######################################################################
# Connect to (and possibly create) database
######################################################################

create_schema = false
if !FileTest.exist?(DB_FILENAME)
  create_schema = true
end
DB = SQLite3::Database.new(DB_FILENAME)
if create_schema
  schema_file = File.read(DB_SCHEMA)
  DB.execute(schema_file)
end


######################################################################
# Subroutines
######################################################################

def generate_short_id(url)
  Digest::SHA1.hexdigest(url)[0,6]    # Take only the first 6 chars
end

def make_short_url(url)
  "#{BASE_SHORT_URL}/#{generate_short_id(url)}"
end



######################################################################
# REST routes
######################################################################

post '/encode' do
  content_type :json

  data = JSON.parse(request.body.read)
  if (data['url'])
    short_url = DB.execute("SELECT short_url FROM urls WHERE url = ?", data['url']).first
    if short_url
      result = { error: "URL already shortened",
                 url: data['url'], short_url: short_url }
      status 409  # HTTP 409 "Conflict"   # @TODO: or should we use something like HTTP 303 "See Other" ?
      json result
    else
      short_url = make_short_url(data['url'])
      DB.execute("INSERT INTO urls (url, short_url) VALUES (?, ?)",
                  [data['url'], short_url] )
      result = { url: data['url'], short_url: short_url }
      status 200
      json result
    end
  else
    status 400
    { error: "POST is missing JSON field 'url'" }.to_json
  end
end

post '/decode' do
  content_type :json
  data = JSON.parse(request.body.read)
  if (data['short_url'])
    long_url = DB.execute("SELECT url FROM urls WHERE short_url = ?", data['short_url']).first
    if long_url
      result = { url: long_url, short_url: data['short_url'] }
      status 200
      json result
    else
      result = { error: "Short URL not recognized" }
      status 404
      json result
    end
  else
    status 400
    { error: "POST is missing JSON field 'short_url'" }.to_json
  end
end