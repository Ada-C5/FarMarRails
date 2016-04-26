# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
# FILE_PATH = "db/seed_csvs/#{}.csv"
#
# files = {}
#
# CSV.foreach(FILE_PATH, headers: true) do |row|
#   row_hash = row.to_h
#   row_hash.delete("fake")
#   Market.create(row_hash)
# end


hash = {
 market: 'seed_csvs/markets.csv',
 product_sale: 'seed_csvs/product_sales.csv',
 product: 'seed_csvs/products.csv',
 sale: 'seed_csvs/sales.csv',
 vendor: 'seed_csvs/vendors.csv',
}

hash.each do |key, value|
 file_path = value
 CSV.foreach(file_path, headers: true) do |row|
   row_hash = row.to_h
   row_hash.delete("fake")
   key.to_s.camelize.constantize.create(row_hash)
 end
end
