class ProductsController < ApplicationController
  def index
    sort_price = params[:sort]
    if sort_price == "price"
      @products = Product.order(sort_price)
    elsif sort_price == "desc_price"   
      @products = Product.order(price: :desc)
    else
      @products = Product.all
    end

    display_item = params[:display]
    if display_item == "discount"
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
