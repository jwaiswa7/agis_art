module Api
	module V1
		class TickersController < BaseController
          def index
          	tickers = Ticker.all
            json_response tickers
          end
        end
	end
end
