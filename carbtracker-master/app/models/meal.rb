class Meal < ActiveRecord::Base
  validates :name, :presence => true
  has_and_belongs_to_many :foods

  def calorie_total

  end

  # def carb_total

  # end

  # def protein_total

  # end

  # def fat_total

  # end

end
