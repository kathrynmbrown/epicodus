class Sighting < ActiveRecord::Base
  validates :species_id, :presence => true
  validates :region_id, :presence => true
  validates :time, :presence => true
  belongs_to :species
  belongs_to :region
end
