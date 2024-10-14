# Readme

This project is practice, for me to learn using Ruby with Sinatra to build a simple API.

The assignment that I'm following is described in [`ASSIGNMENT.md`](ASSIGNMENT.md). 

## How It Works
The project is implemented using [Sinatra](https://sinatrarb.com/), a domain-specific language 
created for Ruby, to allow people to create web applications quickly. For the datastore, I'm using
SQLite. I also do automated testing using RSpec.

## How to Install
* Clone Git repo
* Run `bundle install`

## How to Start Service
* Run `bundle exec rackup`

## How to Use Service

### Get a short URL for a path
**API Endpoint:** `POST /encode`

**POST Request message:**
```json5
{
  "url": "https://codesubmit.io/library/react"
}
```

Example:\
`curl -i -X POST http://localhost:4567/encode -H "Content-Type: application/json" -d "{\"url\":\"https://codesubmit.io/library/react\"}"`


### Retrieve the path specified by a short URL
**API Endpoint:** `POST /decode`

**POST Request message:**
```json5
{
  "short_url": "https://short.est/GeAi9K"
}
```

Example:\
`curl -i -X POST http://localhost:4567/decode -H "Content-Type: application/json" -d "{\"short_url\":\"https://short.est/123\"}"`




