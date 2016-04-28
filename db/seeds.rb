require 'csv'

#
# FILE_PATH = 'db/seed_csvs/markets.csv'
#
# CSV.foreach(FILE_PATH, headers: true) do |row|
#  row_hash = row.to_h
#  # artist_name = row_hash.delete("artist")
#  # artist = Artist.find_or_create_by(name: artist_name)
#  artist.albums << Album.create(row_hash)   #fix this row!!!! check out records app
# end



market_data = File.read(Rails.root.join('seed_csvs', 'markets.csv'))  
csv = CSV.parse(market_data, :headers => true)
csv.each do |row|
  puts row
  t = Market.new
  t.market_number = row['market_number']
  t.name = row['name']
  t.address = row['address']
  t.city = row['city']
  t.state = row['state']
  t.zip = row['zip']
  t.created_at = row['created_at']
  t.updated_at = row['updated_at']
  t.save
end


#
# namespace :csv do
#   csv_file_path = "seed_csvs/markets.csv"
#   CSV.foreach(csv_file_path) do |row|
#       t = Market.create!(
#       :market_number  => row[0]
#       :name           => row[1]
#       :address        => row[2]
#       :city           => row[3]
#       :state          => row[4]
#       :zip            => row[5]
#       :created_at     => row[6]
#       :updated_at     => row[7]
#       )
#       puts t
#   end
# end




# product_data = File.read(Rails.root.join('seed_csvs', 'products.csv'))
# csv = CSV.parse(product_data, :headers => true)
# csv.each do |row|
#   t = Product.new
#   t.product_number = row['product_number']
#   t.name = row['name']
#   t.vendor_number = row['vendor_number']
#   t.created_at = row['created_at']
#   t.updated_at = row['updated_at']
#   t.save
# end



#
# sale_data = File.read(Rails.root.join('seed_csvs', 'sales.csv'))
# csv = CSV.parse(sale_data, :headers => true)
# csv.each do |row|
#   t = Sale.new
#   t.sale_number = row['sale_number']
#   t.amount = row['amount']
#   t.purchase_time = row['purchase_time']
#   t.vendor_number = row['vendor_number']
#   t.product_number = row['product_number']
#   t.created_at = row['created_at']
#   t.updated_at = row['updated_at']
#   t.save
# end
#
# vendor_data = File.read(Rails.root.join('seed_csvs', 'vendors.csv'))
# csv = CSV.parse(vendor_data, :headers => true)
# csv.each do |row|
#   t = Vendor.new
#   t.vendor_number = row['vendor_number']
#   t.name = row['name']
#   t.num_of_employees = row['num_of_employees']
#   t.market_number = row['market_number']
#   t.created_at = row['created_at']
#   t.updated_at = row['updated_at']
#   t.save
# end
#
#




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
