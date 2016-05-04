class CartedProductsController < ApplicationController

  def index
    @order = current_user.orders.find_by(completed:false)
    @carted_products = @order.carted_products
  end

  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity]
    total_tax = product.tax * quantity.to_f
    subtotal = product.price * quantity.to_f
    total = subtotal + total_tax

    current_order = Order.find_by(completed: false)
    if current_order == nil
       current_order = Order.new(user_id: current_user.id)
       current_order.save
    end

    carted_product = CartedProduct.create(order_id: current_order.id, product_id: params[:product_id], quantity: quantity)

    redirect_to "/carted_products"
  end
end
