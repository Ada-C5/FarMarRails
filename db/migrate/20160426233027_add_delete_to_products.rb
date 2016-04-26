class AddDeleteToProducts < ActiveRecord::Migration
  def change
    add_column :products, :delete, :integer
  end
end
