class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.integer :delete
      t.string :name
      t.string :no_of_employees
      t.integer :market_id
      t.timestamps null: false
    end
  end
end
