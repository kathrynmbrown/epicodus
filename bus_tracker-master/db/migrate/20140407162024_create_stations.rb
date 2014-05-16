class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.column :name, :string
    end
  end
end
