class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name, null: false
      t.integer :employee_count
      t.integer :market_id

      t.timestamps null: false
    end
  end
end
