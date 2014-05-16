class MealsController < ApplicationController
def index
    @meals = Meal.all
    render('meals/index.html.erb')
  end

  def new
    render('meals/new.html.erb')
  end

  def create
    @meal = Meal.new(:name => params[:meal_name],
                    :date => params[:date])

    if @meal.save
      @food = Food.find(params[:food1_id])
      @meal.foods << @food
      @food = Food.find(params[:food2_id])
      @meal.foods << @food
      @food = Food.find(params[:food3_id])
      @meal.foods << @food
      @food = Food.find(params[:food4_id])
      @meal.foods << @food
      @food = Food.find(params[:food5_id])
      @meal.foods << @food
      @food = Food.find(params[:food6_id])
      @meal.foods << @food


      redirect_to("/meals/#{@meal.id}")
    else
      @meals = Meal.all
      render('meals/new.html.erb')
    end
  end

  def show
    @meal = Meal.find(params[:id])
    render('meals/show.html.erb')
  end

  def edit
    @meal = Meal.find(params[:id])
    render('meals/edit.html.erb')
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update(:name => params[:name])
      redirect_to("/meals/#{@meal.id}")
    else
      render('meals/edit.html.erb')
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to("/meals/")
  end
end
