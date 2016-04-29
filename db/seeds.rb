# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
MARKET = "seed_csvs/markets.csv"
VENDOR = "seed_csvs/vendors.csv"
PRODUCT = "seed_csvs/products.csv"
SALE = "seed_csvs/sales.csv"

CSV.foreach(MARKET, headers: true) do |row|
  row_hash = row.to_h
  Market.create(row_hash)
end

CSV.foreach(VENDOR, headers: true) do |row|
  row_hash = row.to_h
  Vendor.create(row_hash)
end

CSV.foreach(PRODUCT, headers: true) do |row|
  row_hash = row.to_h
  Product.create(row_hash)
end

CSV.foreach(SALE, headers: true) do |row|
  row_hash = row.to_h
  Sale.create(row_hash)
end
