class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :index

      t.timestamps null: false
    end
  end
end
