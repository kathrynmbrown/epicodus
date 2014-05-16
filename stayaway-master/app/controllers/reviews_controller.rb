class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @user = current_user
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # @review.user_id = current_user.id
    # @review.place_id = @place.id
    if @review.save
       redirect_to places_path
    else
      render "new"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = "review destoyed!"
      redirect_to reviews_path
    end
  end

private

  def review_params
    params.require(:review).permit(:rating,
                                  :place_id,
                                  :user_id,
                                  :headline,
                                  :content)
  end
end
