class CreateTakerResponse < ActiveRecord::Migration
  def change
    create_table :taker_responses do |t|
      t.column :answer_id, :integer

      t.timestamps
    end
  end
end
