# rake db:seed

require 'csv'

###VENDORS SEEDING###

csv_text = File.read(Rails.root.join('lib', 'seeds', 'vendors.csv'))

csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|
  t = Vendor.new
    t.name = row["name"]
    t.employee_num = row["employee_num"]
    t.market_id = row["market_id"]
  t.save
end

puts "There are now #{Vendor.count} rows in the Vendor table"

###PRODUCTS SEEDING###

csv_text = File.read(Rails.root.join('lib', 'seeds', 'products.csv'))

csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|
  t = Product.new
    t.name = row["name"]
    t.vendor_id = row["vendor_id"]
  t.save
end

puts "There are now #{Product.count} rows in the Product table"

###SALES SEEDING###

csv_text = File.read(Rails.root.join('lib', 'seeds', 'sales.csv'))

csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|
  t = Sale.new
    t.amount = row["amount"]
    t.purchase_time = row["purchase_time"]
    t.vendor_id = row["vendor_id"]
    t.product_id = row["product_id"]
  t.save
end

puts "There are now #{Sale.count} rows in the Sale table"

###MARKETS SEEDING###

csv_text = File.read(Rails.root.join('lib', 'seeds', 'markets.csv'))

csv = CSV.parse(csv_text, :headers => true)

csv.each do |row|
  t = Market.new
    t.name = row["name"]
    t.address = row["address"]
    t.city = row["city"]
    t.county = row["county"]
    t.state = row["state"]
    t.zip = row["zip"]
  t.save
end

puts "There are now #{Market.count} rows in the Market table"
