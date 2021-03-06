class OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity]
    total_tax = product.tax * quantity.to_f
    subtotal = product.price * quantity.to_f
    total = subtotal + total_tax

    order = Order.new(user_id: current_user.id, product_id: params[:product_id], quantity: quantity, subtotal: subtotal, tax: total_tax, total: total)
    order.save

    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find_by(id: params[:id])
    @carted_products = @order.carted_products
  end

  def update
    @order = Order.find_by(id: params[:id])
    @carted_products = @order.carted_products
    @order.subtotal = 0
    
    @carted_products.each do |carted_product|
      @order.subtotal += carted_product.quantity * carted_product.product.price
    end

    @order.tax = @order.subtotal * 0.09
    @order.total = @order.subtotal + @order.tax

    @order.update(subtotal: @order.subtotal , tax: @order.tax, total: @order.total, completed: true)
    
    redirect_to "/orders/#{@order.id}"
  end
end
