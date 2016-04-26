class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      # market_id,name,address,city,county,state,zip_code, date_added
      # integer, string, string, string, string, string, string, datetime
      t.integer :market_id
      t.string :name
      t.string :address
      t.string :city
      t.string :county
      t.string :state
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
