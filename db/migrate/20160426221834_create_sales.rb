class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|

    	t.integer :sale_id, :primary_key
    	t.text :sale_amount, null: false
    	t.text :transaction_time
    	t.integer :vendor_id
    	t.integer :product_id

      t.timestamps null: false
    end
  end
end
