# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
FILE_PATH1= "seed_csvs/markets.csv"
FILE_PATH2= "seed_csvs/products.csv"
FILE_PATH3= "seed_csvs/vendors.csv"
FILE_PATH4= "seed_csvs/sales.csv"

CSV.foreach(FILE_PATH1, headers: true) do |row|
  row_hash = row.to_h
  Market.create(row_hash)
end

CSV.foreach(FILE_PATH2, headers: true) do |row|
  row_hash = row.to_h
  Product.create(row_hash)
end

CSV.foreach(FILE_PATH3, headers: true) do |row|
  row_hash = row.to_h
  Vendor.create(row_hash)
end

CSV.foreach(FILE_PATH4, headers: true) do |row|
  row_hash = row.to_h
  Sale.create(row_hash)
end