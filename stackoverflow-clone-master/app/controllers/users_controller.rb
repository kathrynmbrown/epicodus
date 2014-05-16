class UsersController < ApplicationController
  def home
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy

  end

private

  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation,
                                 :username)
  end
end
