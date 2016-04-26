class AddDeleteToSales < ActiveRecord::Migration
  def change
    add_column :sales, :delete, :integer
  end
end
