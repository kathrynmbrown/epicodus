class CreateStationsAndLines < ActiveRecord::Migration
  def change
    create_table :stations_and_lines do |t|
      t.column :line_id, :int
      t.column :station_id, :int
      t.column :stop_time, :time
    end
  end
end
