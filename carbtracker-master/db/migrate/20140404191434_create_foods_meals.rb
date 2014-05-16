class CreateFoodsMeals < ActiveRecord::Migration
  def change
    create_table :foods_meals do |t|
      t.belongs_to :food
      t.belongs_to :meal
    end
  end
end
