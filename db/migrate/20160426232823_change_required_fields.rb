class ChangeRequiredFields < ActiveRecord::Migration
  def change
    remove_column(:markets, :created_at)
    remove_column(:vendors, :created_at)
    remove_column(:sales, :created_at)
    remove_column(:products, :created_at)
    add_column :markets, :created_at, :datetime
    add_column :vendors, :created_at, :datetime
    add_column :products, :created_at, :datetime
    add_column :sales, :created_at, :datetime

    remove_column(:markets, :updated_at)
    remove_column(:vendors, :updated_at)
    remove_column(:sales, :updated_at)
    remove_column(:products, :updated_at)
    add_column :markets, :updated_at, :datetime
    add_column :vendors, :updated_at, :datetime
    add_column :products, :updated_at, :datetime
    add_column :sales, :updated_at, :datetime
  end
end
