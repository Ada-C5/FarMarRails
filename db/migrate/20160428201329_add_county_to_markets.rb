class AddCountyToMarkets < ActiveRecord::Migration
  def change
    remove_column(:markets, :zip)
    remove_column(:markets, :state)
    add_column(:markets, :county, :string)
    add_column(:markets, :state, :string)
    add_column(:markets, :zip, :string)
  end
end
