class RemovePrimaryKeyNameFromMarkets < ActiveRecord::Migration
  def change
    remove_column :markets, :primary_key, :integer
  end
end
