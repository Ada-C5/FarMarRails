# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

MARKET_FILE_PATH = 'seed_csvs/markets.csv'
VENDOR_FILE_PATH = 'seed_csvs/vendors.csv'
SALE_FILE_PATH = 'seed_csvs/sales.csv'
PRODUCT_FILE_PATH = 'seed_csvs/products.csv'

CSV.foreach(MARKET_FILE_PATH, headers: true) do |row|
  row_hash = row.to_h
  Market.create(row_hash)#populating the artist and slbums tables and making connection between them via artist_id assignement
end

CSV.foreach(VENDOR_FILE_PATH, headers: true) do |row|
  row_hash = row.to_h
  Vendor.create(row_hash)#populating the artist and slbums tables and making connection between them via artist_id assignement
end

CSV.foreach(SALE_FILE_PATH, headers: true) do |row|
  row_hash = row.to_h
  Sale.create(row_hash)#populating the artist and slbums tables and making connection between them via artist_id assignement
end

CSV.foreach(PRODUCT_FILE_PATH, headers: true) do |row|
  row_hash = row.to_h
  Product.create(row_hash)#populating the artist and slbums tables and making connection between them via artist_id assignement
end
