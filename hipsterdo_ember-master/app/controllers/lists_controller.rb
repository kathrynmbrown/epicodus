class ListsController < ApplicationController

  def index
    @lists = List.all
    render :json => @lists
  end

  def create
    @list = List.new(list_params)
    if @list.save
      render :json => @list, :status => 201
    else
      render :json => { :errors => @list.errors }, :status => 422
    end
  end

  def show
    @list = List.find(params[:id])
    render :json => @list
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      head :no_content
    else
      render :json => {:errors => @list.errors}, :status => 422
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    head :no_content
  end

private
  def list_params
    params.fetch(:list).permit(:name, :description, :id)
  end

end
