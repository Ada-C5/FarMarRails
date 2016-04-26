# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

MARKET_FILE_PATH = 'db/seed_csvs/markets.csv'
VENDOR_FILE_PATH = 'db/seed_csvs/vendors.csv'
SALE_FILE_PATH = 'db/seed_csvs/sales.csv'
PRODUCT_FILE_PATH = 'db/seed_csvs/products.csv'

CSV.foreach(MARKET_FILE_PATH) do |row|
  row_hash = row.to_h
  artist_name = row_hash.delete("artist")

  artist = Artist.find_or_create_by(name: artist_name)
  artist.albums << Album.create(row_hash)#populating the artist and slbums tables and making connection between them via artist_id assignement
end
