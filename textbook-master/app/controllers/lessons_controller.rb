class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    render('lessons/index.html.erb')
  end

  def new
    @lesson = Lesson.new
    render('lessons/new.html.erb')
  end

  def create
    @lessons = Lesson.all
    @lesson = Lesson.new(:name => params[:name],
                            :lesson_text => params[:lesson_text])
    if @lesson.save
      render('lessons/index.html.erb')

    else
      render('lessons/new.html.erb')
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    render('lessons/show.html.erb')
  end

  def edit
    @lesson = Lesson.find(params[:id])
    render('lessons/edit.html.erb')
  end

  def update
    @lessons = Lesson.all
    @lesson = Lesson.find(params[:id])
    @lesson.update(name: params[:name],
                      lesson_text: params[:lesson_text])
    if @lesson.save
      render('lessons/index.html.erb')
    else
      render('lessons/edit.html.erb')
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to('/lessons')
  end

end
