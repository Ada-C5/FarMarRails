class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :sale_number
      t.integer :amount
      t.datetime :purchase_time
      t.integer :vendor_number
      t.integer :product_number

      t.timestamps null: false
    end
  end
end
