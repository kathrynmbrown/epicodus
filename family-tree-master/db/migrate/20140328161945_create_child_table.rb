class CreateChildTable < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.column :parent1_id, :integer
      t.column :parent2_id, :integer
    end
  end
end
