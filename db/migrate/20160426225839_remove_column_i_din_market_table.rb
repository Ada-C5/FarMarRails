class RemoveColumnIDinMarketTable < ActiveRecord::Migration
  def change
    remove_column :markets, :market_id
  end
end
