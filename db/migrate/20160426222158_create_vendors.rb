class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      # name,no_of_employees,market_id, date_added
      # string, integer, integer, datetime

      t.string :name
      t.integer :no_of_employees
      t.integer :market_id

      t.timestamps null: false
    end
  end
end
