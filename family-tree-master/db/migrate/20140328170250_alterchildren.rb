class Alterchildren < ActiveRecord::Migration
  def change
    remove_column :children, :parent1_id
    remove_column :children, :parent2_id
    add_column :children, :person_id, :integer
    add_column :children, :parent_id, :integer
  end
end
