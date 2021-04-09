class HomepageController < ApplicationController
  def index
  	@tickers = Ticker.all
  end
end
