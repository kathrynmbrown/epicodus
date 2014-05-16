class MessagesController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def index
    @messages = Message.all
  end  

  def new
    @user = current_user
    @message = Message.new
  end
  
  def create 
    @message = Message.new(message_params)
    if @message.save
      render "success"
    else
      render 'new'
    end  
  end  

  def show
    @message = Message.find(params[:id])
  end  

private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end  
end  