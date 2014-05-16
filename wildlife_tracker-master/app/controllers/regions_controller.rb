class RegionsController < ApplicationController
  def index
    @regions = Region.all
    #@sightings = Sighting.all
    render('/regions/index.html.erb')
  end

  def region_select
    @species_id = params[:species_id]
    @regions = Region.all
  end
end
