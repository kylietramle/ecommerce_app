class AddInStockBooleanToProducts < ActiveRecord::Migration
  def change
    add_column :products, :stock_status, :boolean
  end
end
