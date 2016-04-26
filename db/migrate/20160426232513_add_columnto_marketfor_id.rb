class AddColumntoMarketforId < ActiveRecord::Migration
  def change
    add_column :markets, :market_id, :integer
  end
end
