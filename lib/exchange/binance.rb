module Exchange
	require 'net/http'
	require "redis"

	class Binance
		
		def tickers
			Ticker::SYMBOLS.each do |symbol|
			  response = JSON.parse get(symbol)
			  update_ticker(response) if Ticker.find_by_symbol(symbol)
			end
		end

		private 

		def update_ticker(response)
			ticker = Ticker.find_by_symbol(response["symbol"])
			ticker.update!(
			  	priceChange: response["priceChange"].to_f, 
			  	priceChangePercent: response["priceChangePercent"].to_f, 
			  	weightedAvgPrice: response["weightedAvgPrice"].to_f, 
			  	prevClosePrice: response["prevClosePrice"].to_f, 
			  	lastPrice: response["lastPrice"].to_f, 
			  	lastQty: response["lastQty"].to_f, 
			  	bidPrice: response["bidPrice"].to_f, 
			  	bidQty: response["bidQty"].to_f, 
			  	askPrice: response["askPrice"].to_f, 
			  	askQty: response["askQty"].to_f, 
			  	openPrice: response["openPrice"].to_f, 
			  	highPrice: response["highPrice"].to_f, 
			  	lowPrice: response["lowPrice"].to_f, 
			  	volume: response["volume"].to_f, 
			  	quoteVolume: response["quoteVolume"].to_f, 
			  	openTime: response["openTime"].to_i, 
			  	closeTime: response["closeTime"].to_i, 
			  	count: response["count"].to_i
			  )
		end

		def get(symbol="BTCUSDT")
		  uri = URI("https://api.binance.com/api/v3/ticker/24hr?symbol=#{symbol}")
          Net::HTTP.get(uri)
		end
	end
end