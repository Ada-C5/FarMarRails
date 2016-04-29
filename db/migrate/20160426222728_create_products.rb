class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_id
      t.string :product_name, null: false
      t.integer :vendor_id, null: false

      t.timestamps null: false
    end
  end
end
