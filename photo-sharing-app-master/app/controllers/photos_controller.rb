class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    current_user.photos << @photo
    if @photo.save
      flash[:notice] = "Your photo has been added!"
      redirect_to photo_path(@photo)
    else
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end


private

  def photo_params
    params.require(:photo).permit(:description,
                                  :image)
  end
end
