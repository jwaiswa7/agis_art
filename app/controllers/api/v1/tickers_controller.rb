module Api
	module V1
		class TickersController < BaseController
          def index
          	tickers = Redis.new.get("tickers")
            json_response tickers
          end
        end
	end
end
