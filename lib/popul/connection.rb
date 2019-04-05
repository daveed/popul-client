require 'faraday'
require 'faraday_middleware'
require 'popul/response'
require 'json'

module Popul
  #
  # Module Connection provides a connection to the Popul API
  #
  module Connection
    #
    # Returns a Faraday::Connection for Popul authentication
    #
    #
    # @return [Faraday::Connection] a connection used to request an access token
    #
    def connection
      options = {
        headers: {
          accept: 'application/json',
          user_agent: user_agent
        },
        url: endpoint
      }
      @connection ||= Faraday.new(options) do |faraday|
        faraday.request  :url_encoded
        faraday.response :json
        faraday.response :logger
        faraday.adapter adapter
      end
    end
  end
end
