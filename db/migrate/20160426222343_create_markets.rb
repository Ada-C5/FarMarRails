class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.integer :market_number
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps null: false
    end
  end
end
