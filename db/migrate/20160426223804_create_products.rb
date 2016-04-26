class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :product_number
      t.string :name
      t.integer :vendor_number

      t.timestamps null: false
    end
  end
end
