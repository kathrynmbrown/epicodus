class FoodsController < ApplicationController

  def index
    @foods = Food.all
    render('foods/index.html.erb')
  end

  def new
    render('foods/new.html.erb')
  end

  def create
    @food = Food.new(:name => params[:name],
                     :calories => params[:calories],
                     :carb_grams => params[:carb_grams],
                     :protein_grams => params[:protein_grams],
                     :fat_grams => params[:fat_grams])
    if @food.save
      redirect_to("/foods/#{@food.id}")
    else
      @foods = Food.all
      render('foods/new.html.erb')
    end
  end

  def show
    @food = Food.find(params[:id])
    render('foods/show.html.erb')
  end

  def edit
    @food = Food.find(params[:id])
    render('foods/edit.html.erb')
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(:name => params[:name])
      redirect_to("/foods/#{@food.id}")
    else
      render('foods/edit.html.erb')
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to("/foods/")
  end
end
