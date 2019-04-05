require 'faraday'
require 'multi_json'

module Popul
  module Response
    #
    # Class ParseJson provides methods to parse responses
    #
    class ParseJson < Faraday::Response::Middleware
      def on_complete(env)
        env[:body] = parse_body(env[:body])
      end

      def parse_body(body)
        if body.nil?
          nil
        else
          MultiJson.load(body)
        end
      end
    end
  end
end
