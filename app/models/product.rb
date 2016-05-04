class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products

  has_many :carted_products  
  has_many :orders, through: :carted_products

  def sale_message
    price < 2 ? "Discount" : "On Sale!"
  end

  def tax
    (0.09 * price).to_f
  end

  def sum
    sum = price + tax
  end

  def stock_text
    stock_status == false ? "Out of Stock" : ""
  end
end

  