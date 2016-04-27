class AddIndexToMarkets < ActiveRecord::Migration
  def change
    add_index :products, :vendor_id
    add_index :sales, :vendor_id
    add_index :sales, :product_id
    add_index :vendors, :market_id
  end
end
