class ProductsController < ApplicationController
  def home
    @products = Product.all
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      render 'show'
    else
      render 'new'
    end
  end

  def show
     @product = Product.find_by_id(params[:id])
  end

  def edit
     @product = Product.find(params[:id])
  end

  def update
     @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "product updated successfully"
    else
      render 'edit', notice: "Invalid entry. Please try again."
    end
  end

  def destroy
    @product = Product.find_by(params[:id])
    @product.destroy
    render 'index'
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :product_image)
  end
end


