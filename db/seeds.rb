# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
MARKET_PATH = 'seed_csvs/markets.csv' #relative to project path

CSV.foreach(MARKET_PATH) do |row|

  row_hash = {
    name: row[1],
    street: row[2],
    city: row[3],
    county: row[4],
    state: row[5],
    zip: row[6]
  }

  market = Market.create(row_hash)

end
