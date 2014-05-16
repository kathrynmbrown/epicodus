class DropTakerResponseTable < ActiveRecord::Migration
  def change
    drop_table :taker_responses
  end
end
