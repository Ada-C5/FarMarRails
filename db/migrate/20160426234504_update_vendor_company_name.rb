class UpdateVendorCompanyName < ActiveRecord::Migration
  def change
    remove_column(:vendors, :names_of_employees)
    add_column(:vendors, :name, :string)
  end
end
