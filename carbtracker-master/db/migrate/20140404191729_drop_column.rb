class DropColumn < ActiveRecord::Migration
  def change
    remove_column :foods, :meal_id
  end
end
