class ProductsController < ApplicationController
  def index
    if params[:sort]== "price"
      @products = Product.order(sort_price)
    elsif params[:sort] == "desc_price"   
      @products = Product.order(price: :desc)
    elsif params[:category]
      @products = Category.find_by(name: params[:category]).products
    elsif params[:display]
      @products = Product.where("price < ?", 50 )
    else
      @products = Product.all
    end
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    @product.save

    flash[:success] = "Product Created!"
    redirect_to "/products/#{@product.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(name: params[:name], price: params[:price], image: params[:image], description: params[:description])

    flash[:success] = "Product Updated!"
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy

    flash[:danger] = "Product Deleted"
    redirect_to "/products"
  end
end
