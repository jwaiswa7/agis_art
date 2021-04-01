# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_01_112926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "tickers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "symbol"
    t.decimal "priceChange", precision: 32, scale: 16, default: "0.0"
    t.decimal "priceChangePercent", precision: 32, scale: 16, default: "0.0"
    t.decimal "weightedAvgPrice", precision: 32, scale: 16, default: "0.0"
    t.decimal "prevClosePrice", precision: 32, scale: 16, default: "0.0"
    t.decimal "lastPrice", precision: 32, scale: 16, default: "0.0"
    t.decimal "lastQty", precision: 32, scale: 16, default: "0.0"
    t.decimal "bidPrice", precision: 32, scale: 16, default: "0.0"
    t.decimal "bidQty", precision: 32, scale: 16, default: "0.0"
    t.decimal "askPrice", precision: 32, scale: 16, default: "0.0"
    t.decimal "askQty", precision: 32, scale: 16, default: "0.0"
    t.decimal "openPrice", precision: 32, scale: 16, default: "0.0"
    t.decimal "highPrice", precision: 32, scale: 16, default: "0.0"
    t.decimal "lowPrice", precision: 32, scale: 16, default: "0.0"
    t.decimal "volume", precision: 32, scale: 16, default: "0.0"
    t.decimal "quoteVolume", precision: 32, scale: 16, default: "0.0"
    t.string "openTime"
    t.string "closeTime"
    t.string "count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
