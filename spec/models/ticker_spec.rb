require 'rails_helper'

RSpec.describe Ticker, type: :model do
  let(:ticker) { FactoryBot.create :ticker}

  it "is a valid ticker" do 
    expect(ticker).to be_valid
  end

  it "symbol is nuique" do 
  	ticker
  	ticker_2 = FactoryBot.build(:ticker)
  	expect(ticker_2).not_to be_valid
  end

  it "symbol is accepted" do 
  	ticker.symbol = "BTCJEVE"
  	expect(ticker).not_to be_valid
  end
end
