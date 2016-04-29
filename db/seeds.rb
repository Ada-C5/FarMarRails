# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

markets = CSV.read('seed_csvs/markets.csv', :headers => true)
market_hash = {}
markets.each do |row|
  market_hash[:market_id] = row[0].to_i
  market_hash[:name] = row[1].to_s
  market_hash[:address] = row[2].to_s
  market_hash[:city] = row[3].to_s
  market_hash[:county] = row[4].to_s
  market_hash[:state] = row[5].to_s
  market_hash[:zip_code] = row[6].to_i
  Market.create(market_hash)
end


products = CSV.read('seed_csvs/products.csv', :headers => true)
product_hash = {}
products.each do |row|
  product_hash[:product_id] = row[0].to_i
  product_hash[:item] = row[1].to_s
  product_hash[:vendor_id] = row[2].to_i
  Product.create(product_hash)
end


sales = CSV.read('seed_csvs/sales.csv', :headers => true)
sale_hash = {}
sales.each do |row|
  sale_hash[:sale_id] = row[0].to_i
  sale_hash[:sale_amount] = row[1].to_i
  sale_hash[:transaction_time] = row[2].to_s
  sale_hash[:vendor_id] = row[3].to_i
  sale_hash[:product_id] = row[4].to_i
  Sale.create(sale_hash)
end


vendors = CSV.read('seed_csvs/vendors.csv', :headers => true)
vendor_hash = {}
vendors.each do |row|
  vendor_hash[:vendor_id] = row[0].to_i
  vendor_hash[:name] = row[1].to_s
  vendor_hash[:employees] = row[2].to_i
  vendor_hash[:market_id] = row[3].to_i
  Vendor.create(vendor_hash)
end
