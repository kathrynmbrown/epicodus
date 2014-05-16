class AddTimestampToDivisions < ActiveRecord::Migration
  def change
    add_column :divisions, :created_at, :datetime
    add_column :divisions, :updated_at, :datetime
  end
end
