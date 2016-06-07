# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'csv'
MARKET_PATH   = 'seed_csvs/markets.csv' #relative to project path
VENDOR_PATH   = 'seed_csvs/vendors.csv'
PRODUCT_PATH  = 'seed_csvs/products.csv'
SALE_PATH     = 'seed_csvs/sales.csv'

CSV.foreach(MARKET_PATH) do |row|

  row_hash = {
    name: row[1],
    street: row[2],
    city: row[3],
    county: row[4],
    state: row[5],
    zip: row[6]
  }

  market = Market.create(row_hash)

end


CSV.foreach(VENDOR_PATH) do |row|

  row_hash = {
    name: row[1],
    employee_count: row[2].to_i,
    market_id: row[3].to_i
  }
   Vendor.create(row_hash)

end

CSV.foreach(PRODUCT_PATH) do |row|

  row_hash = {
    name: row[1],
    vendor_id: row[2].to_i
  }

  Product.create(row_hash)

end


CSV.foreach(SALE_PATH) do |row|

  row_hash = {
    amount: row[1],
    purchase_time: row[2],
    vendor_id: row[3].to_i,
    product_id: row[4].to_i

  }

  Sale.create(row_hash)

end
