class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.column :name, :string
      t.column :meal_id, :integer
      t.column :calories, :integer
      t.column :carb_grams, :integer
      t.column :protein_grams, :integer
      t.column :fat_grams, :integer

      t.timestamps
    end
  end
end
