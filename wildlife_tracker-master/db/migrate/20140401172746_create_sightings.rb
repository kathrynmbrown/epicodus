class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.column :species_id, :integer
      t.column :region_id, :integer
      t.column :time, :datetime

      t.timestamps
    end
  end
end
