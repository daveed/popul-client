module Popul
  module Cbsa
    def cbsa(zip)
      get("/cbsa/#{zip}")
    end
  end
end
