class AddSequenceId < ActiveRecord::Migration
  def change
    add_column :lessons, :sequence_id, :int
  end
end
