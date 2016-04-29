class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|

    	t.integer :market_id, :primary_key
    	t.text :name, null: false
    	t.text :address
    	t.text :city
    	t.text :county
    	t.text :state
    	t.integer :zip_code

      t.timestamps null: false
    end
  end
end
