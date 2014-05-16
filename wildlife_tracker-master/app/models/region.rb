class Region < ActiveRecord::Base

  validates :name, :presence => true
  has_many :sightings
  has_many :species, through: :sightings

end
