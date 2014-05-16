class AddTextColumn < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_text, :text
  end
end
