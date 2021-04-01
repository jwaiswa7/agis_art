module Exchange
	require 'net/http'
	require "redis"

	class Binance
		SYMBOLS = %w[BTCUSDT ETHUSDT LTCUSDT]

		def tickers
			tickers = SYMBOLS.map { |symbol|  get(symbol)}
			redis = Redis.new
            redis.set("tickers", tickers)
		end

		private 

		def get(symbol="BTCUSDT")
		  uri = URI("https://api.binance.com/api/v3/ticker/24hr?symbol=#{symbol}")
          Net::HTTP.get(uri)
		end
	end
end