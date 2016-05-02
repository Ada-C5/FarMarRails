class AddDeleteToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :delete, :integer
  end
end
