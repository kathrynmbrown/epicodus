class ProfilesController < ApplicationController
  def index
    @profiles = Profile.all
  end


  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      render 'show'
    else
      render 'new'
    end
  end

  def show
    @profile = Profile.find_by_id(current_user.id)
  end

  private

  def profile_params
    params.require(:profile).permit(:user_id, :name, :website_link, :twitter_handle, :headline, :avatar)
  end

end
