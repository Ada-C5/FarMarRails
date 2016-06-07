class AddVendorIndexColumntoMarket < ActiveRecord::Migration
  def change
    add_column :markets, :vendor_id, :integer
    add_index :markets, :vendor_id
    add_index :vendors, :market_id
  end
end
