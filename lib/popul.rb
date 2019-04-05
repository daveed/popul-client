require 'popul/version'
require 'popul/configuration'
require 'popul/client'
require 'popul/connection'

#
# Module Popul provides client methods to respond to
#
module Popul
  extend Configuration

  # Cache for Popul::Client.new
  #
  # @return [Popul::Client]
  def self.client(options = {})
    @client ||= Popul::Client.new(options)
  end

  # Delegate to {Popul::Client}
  def self.method_missing(method_name, *args, &block)
    return super unless client.respond_to?(method_name)
    client.send(method_name, *args, &block)
  end

  # Delegate to {Popul::Client}
  def self.respond_to_missing?(method_name, include_private = false)
    client.respond_to?(method_name, include_private) || super
  end
end
