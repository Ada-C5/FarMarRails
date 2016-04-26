# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


MARKETS_PATH = 'db/seed_csvs/markets.csv'
PRODUCTS_PATH = 'db/seed_csvs/products.csv'
SALES_PATH = 'db/seed_csvs/sales.csv'
VENDORS_PATH = 'db/seed_csvs/vendors.csv'

#
# CSV.foreach(FILE_PATH, headers: true) do |row|
#   row_hash = row.to_h
#
# end

require 'csv'


CSV.foreach(VENDORS_PATH, headers: true) do |row|
  row_hash = row.to_h
  Vendor.create(row_hash)
end
