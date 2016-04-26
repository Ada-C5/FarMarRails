class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :no_of_employees

      t.timestamps null: false
    end
  end
end
