class ReviewsController < ApplicationController

  def index
      @reviews = Review.all
  end

  def new
    @review = Review.new(:product_id => params[:product_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @review = Review.find_by(params[:id])
  end

  def edit
    @review = Review.find_by(params[:id])
  end

  def update
    @review = Review.find_by(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review), notice: "review updated successfully"
    else
      render 'edit', notice: "Invalid entry. Please try again."
    end
  end

  def destroy
    @review = Review.find_by(params[:id])
    @review.destroy
    render 'index'
  end

  def review_params
    params.require(:review).permit(:title, :content, :user_id, :product_id, :rating)
  end
end
