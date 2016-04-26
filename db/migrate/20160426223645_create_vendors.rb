class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :vendor_number
      t.string :names_of_employees
      t.integer :num_of_employees
      t.integer :market_number

      t.timestamps null: false
    end
  end
end
