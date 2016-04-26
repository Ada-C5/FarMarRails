class AddMarketIdToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :market_id, :integer
  end
end
