class AddColumnSaleIdToSalesTable < ActiveRecord::Migration
  def change
    add_column :sales, :sale_id, :integer
  end
end
