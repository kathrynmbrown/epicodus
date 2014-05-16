class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.column :description, :string
      t.column :employee_id, :int
      t.column :project_id, :int
      t.column :date, :date

      t.timestamps
    end
  end
end
