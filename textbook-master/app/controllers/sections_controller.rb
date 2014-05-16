class SectionsController < ApplicationController

  def new
    @section = Section.new
    render('sections/new.html.erb')
  end

  def create
    @sections = Section.all
    @sections = Section.new(:name => params[:name])
    if @section.save
      render('lessons/index.html.erb')

    else
      render('sections/new.html.erb')
    end
  end
end
