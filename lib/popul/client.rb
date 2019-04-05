require 'popul/connection'
require 'popul/request'
require 'popul/client/cbsa'

module Popul
  # Wrapper for the Popul API
  class Client
    include Connection
    include Request
    include Cbsa

    # @private
    attr_accessor(*Configuration::OPTIONS_KEYS)

    # Creates a new Popul::Client
    def initialize(options = {})
      options = Popul.options.merge(options)
      Configuration::OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
  end
end
