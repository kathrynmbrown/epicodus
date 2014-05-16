class SpeciesController < ApplicationController
  def index
    @species = Species.all
    render('species/index.html.erb')
  end

  def show
    @this_species = Species.find(params[:id])
    @sightings = Sighting.where({:species_id => params[:id]})

  end

end
