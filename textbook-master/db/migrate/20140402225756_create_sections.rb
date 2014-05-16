class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.column :name, :string

      t.timestamps
    end
    add_column :lessons, :section_id, :int
  end
end
