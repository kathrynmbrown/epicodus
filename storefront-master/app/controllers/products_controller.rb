class ProductsController < ApplicationController

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def show
    @product = Product.find_by(params[:id])
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price, :productimage, :id)
  end

end
