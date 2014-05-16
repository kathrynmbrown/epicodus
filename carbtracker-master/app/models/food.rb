class Food < ActiveRecord::Base
  validates :name, :presence => true
  validates :calories, :presence => true
  validates :carb_grams, :presence => true
  validates :protein_grams, :presence => true
  validates :fat_grams, :presence => true
  has_and_belongs_to_many :meals

end
