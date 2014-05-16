class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :content
      t.references :notable, { :polymorphic => true }
      t.timestamps
    end
  end
end
