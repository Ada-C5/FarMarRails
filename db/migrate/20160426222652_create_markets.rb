class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.integer :market_id
      t.string :market_name
      t.string :address
      t.string :city
      t.string :county
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
