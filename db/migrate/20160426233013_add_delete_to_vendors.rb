class AddDeleteToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :delete, :integer
  end
end
