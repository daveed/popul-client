require 'faraday'

module Popul
  #
  # Defines constants and methods related to configuration
  #
  module Configuration
    # An array of keys in the options hash when configuring a {Popul::Client}
    OPTIONS_KEYS = %i[
      adapter
      client_id
      client_secret
      endpoint
      user_agent
    ].freeze

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER       = Faraday.default_adapter

    # By default, don't set a client id
    DEFAULT_CLIENT_ID     = nil

    # By default, don't set a client secret
    DEFAULT_CLIENT_SECRET = nil

    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT      = 'http://api.daveed.io'.freeze

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT    = "Popul #{Popul::VERSION}".freeze

    # @private
    attr_accessor(*OPTIONS_KEYS)

    # When this module is extended
    # set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      OPTIONS_KEYS.inject({}) do |options, key|
        options.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter       = DEFAULT_ADAPTER
      self.client_id     = DEFAULT_CLIENT_ID
      self.client_secret = DEFAULT_CLIENT_SECRET
      self.endpoint      = DEFAULT_ENDPOINT
      self.user_agent    = DEFAULT_USER_AGENT
      self
    end
  end
end
