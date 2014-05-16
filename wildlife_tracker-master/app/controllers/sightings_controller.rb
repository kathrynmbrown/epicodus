class SightingsController < ApplicationController
  def index
    @sightings = Sighting.all
    @species_id = params[:species_id]
    @region_id = params[:region_id]
    render('/sightings/index.html.erb')
  end

  def new_sighting
    # @s_id = params[:species_id]
    @sighting = Sighting.new(:species_id => params[:species_id], :region_id => params[:region_id], :time => params[:time])
    @sighting.save
    render('/sightings/success.html.erb')
  end




  # def insert_sighting
  #   region = Region.where({:name => params[:region]}).first
  #   if region == nil
  #     region = Region.create({:name => params[:region]})
  #   end
  #   species = Species.where({:name => params[:species]}).first
  #   if species == nil
  #     species = Species.create({:name => params[:species]})
  #   end
  #   Sighting.create(:species_id => species.id, :region_id => region.id, :time => params[:time]})
  #   render('/sightings/index.html.erb')
  #   end
  # end
end
