class Product < ActiveRecord::Base
  def sale_message
    price < 2 ? "Discount" : "On Sale!"
  end

  def tax
    (0.09 * price).to_f
  end

  def sum
    sum = price + tax
  end

end
