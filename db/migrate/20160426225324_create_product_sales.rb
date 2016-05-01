class CreateProductSales < ActiveRecord::Migration
  def change
    create_table :product_sales do |t|
      t.integer :sale_id
      t.integer :product_id
      t.timestamps null: false
    end
  end
end
