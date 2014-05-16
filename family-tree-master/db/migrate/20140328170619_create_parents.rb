class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.column :name, :string
    end
  end
end
