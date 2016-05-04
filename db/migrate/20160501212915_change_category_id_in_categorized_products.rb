class ChangeCategoryIdInCategorizedProducts < ActiveRecord::Migration
  def change
    rename_column :categorized_products, :categorized_id, :category_id
  end
end
