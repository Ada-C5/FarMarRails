class VendorMarketAssociation < ActiveRecord::Migration
  def change
  	remove_column :vendors, :market_id
  	add_column :vendors, :market_id, :integer
  end
end
