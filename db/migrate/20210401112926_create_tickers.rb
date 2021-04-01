class CreateTickers < ActiveRecord::Migration[6.0]
  def change
    create_table :tickers, id: :uuid do |t|
      t.string :symbol
      t.decimal :priceChange, precision: 32, scale: 16, default: "0.0"
      t.decimal :priceChangePercent, precision: 32, scale: 16, default: "0.0"
      t.decimal :weightedAvgPrice, precision: 32, scale: 16, default: "0.0"
      t.decimal :prevClosePrice, precision: 32, scale: 16, default: "0.0"
      t.decimal :lastPrice, precision: 32, scale: 16, default: "0.0"
      t.decimal :lastQty, precision: 32, scale: 16, default: "0.0"
      t.decimal :bidPrice, precision: 32, scale: 16, default: "0.0"
      t.decimal :bidQty, precision: 32, scale: 16, default: "0.0"
      t.decimal :askPrice, precision: 32, scale: 16, default: "0.0"
      t.decimal :askQty, precision: 32, scale: 16, default: "0.0"
      t.decimal :openPrice, precision: 32, scale: 16, default: "0.0"
      t.decimal :highPrice, precision: 32, scale: 16, default: "0.0"
      t.decimal :lowPrice, precision: 32, scale: 16, default: "0.0"
      t.decimal :volume, precision: 32, scale: 16, default: "0.0"
      t.decimal :quoteVolume, precision: 32, scale: 16, default: "0.0"
      t.string :openTime
      t.string :closeTime
      t.string :count

      t.timestamps
    end
  end
end
