class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.integer :market_id
      t.string :market_name, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :county
      t.string :state, null: false
      t.integer :zip

      t.timestamps null: false
    end
  end
end
