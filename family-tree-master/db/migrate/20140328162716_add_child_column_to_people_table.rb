class AddChildColumnToPeopleTable < ActiveRecord::Migration
  def change
    add_column :people, :child_id, :integer
  end
end
