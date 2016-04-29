class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|

    	t.integer :vendor_id, :primary_key
    	t.text :name, null: false
    	t.text :employees
    	t.text :market_id

      t.timestamps null: false
    end
  end
end
