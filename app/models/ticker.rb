class Ticker < ApplicationRecord
	SYMBOLS = %w[BTCUSDT ETHUSDT LTCUSDT]
	validates :symbol, presence: true
    validates_inclusion_of :symbol, :in => SYMBOLS
    validates :symbol, uniqueness: true

end
