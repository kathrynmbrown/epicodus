class RenameEventsMeta < ActiveRecord::Migration
  def change
    rename_table :events_meta, :repetitions
  end
end
