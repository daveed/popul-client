module Popul
  #
  # Module Request provides get method to request Popul API
  #
  module Request

    def get(path, params = {})
      request(:get, path, params)
    end

    def request(http_method, path, params = {})
      response = connection.get(path, params)
      response.body if response
    end

  end
end
