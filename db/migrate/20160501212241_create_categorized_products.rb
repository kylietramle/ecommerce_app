class CreateCategorizedProducts < ActiveRecord::Migration
  def change
    create_table :categorized_products do |t|
      t.integer :categorized_id
      t.integer :product_id

      t.timestamps null: true
    end
  end
end
