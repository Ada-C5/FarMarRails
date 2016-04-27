# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

FILE_PATH_MARKETS         = 'db/seed_csvs/markets.csv'
FILE_PATH_VENDORS         = 'db/seed_csvs/vendors.csv'
FILE_PATH_PRODUCTS        = 'db/seed_csvs/products.csv'
FILE_PATH_SALES           = 'db/seed_csvs/sales.csv'


CSV.foreach(FILE_PATH_MARKETS, headers: true) do |row|
  Market.create(row.to_h)
end
