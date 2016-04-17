class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new
  end

  def create
    @new_product = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    @new_product.save
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
  end
end
