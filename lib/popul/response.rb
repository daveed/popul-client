require 'faraday'
require 'popul/response/parse_json'

Faraday::Response.register_middleware(
  json: -> { Popul::Response::ParseJson }
)
