class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :markets, :delete, :fake_id
    rename_column :products, :delete, :fake_id
    rename_column :vendors, :delete, :fake_id
    rename_column :sales, :delete, :fake_id
  end
end
