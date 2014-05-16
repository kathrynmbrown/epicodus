class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
    render 'new'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User created.'
      redirect_to users_path
    else
      render 'new'
    end
  end



private
  def user_params
    params.require(:user).permit(:username)
  end
end
