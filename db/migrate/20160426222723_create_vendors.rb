class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :vendor_id
      t.string :vendor_name, null: false
      t.integer :num_of_employees, null: false
      t.integer :market_id, null: false

      t.timestamps null: false
    end
  end
end
