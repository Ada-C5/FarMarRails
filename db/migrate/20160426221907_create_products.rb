class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	
    	t.integer :product_id, :primary_key
    	t.text :item, null: false
    	t.integer :vendor_id

      t.timestamps null: false
    end
  end
end
