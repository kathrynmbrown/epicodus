class OrdersController < ApplicationController
    def home

    end  

    def index
      @orders = Order.all
    end  

    def new
      @order = Order.new
    end
    
    def create 
      @order = Order.new(order_params)
      if @order.save
        redirect_to new_message_path
      else
        render 'new'
      end  
    end  

    def show
      @order= Order.find(params[:id])
    end

    def edit
      @order = Order.find(params[:id])
    end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to order_path(@order), notice: "Order updated successfully"
    else
      render 'edit', notice: "Invalid entry. Please try again."
    end
  end

    def destroy
      @order = Order.find(params[:id])
      @order.destroy
      render "success"
    end  

  def order_params
    params.require(:order).permit(:drink_category, :name, :size, :milk, :flavor, :user_name, :id)
  end   
end  

