class PlacesController < ApplicationController
   skip_before_action :authorize, only: [:index, :show]

  def index
    @places = Place.all
  end

  def new
    @user = current_user
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    @place.save
    if @place.save
       redirect_to places_path
    else
      render "new"
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def destroy
    @place = Place.find(params[:id])
    if @place.destroy
      flash[:notice] = "Place destoyed!"
      redirect_to places_path
    end
  end

private

  def place_params
    params.require(:place).permit(:title,
                                  :description,
                                  :user_id,
                                  :housepic)
  end
end

