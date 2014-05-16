class CreateEventsMeta < ActiveRecord::Migration
  def change
    create_table :events_meta do |t|
      t.belongs_to :event
      t.string  :repeat_interval
    end
  end
end
