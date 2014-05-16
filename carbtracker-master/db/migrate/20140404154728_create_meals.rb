class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.column :name, :string

      t.timestamps
    end
  end
end
