class CreateEmployeesAndProjects < ActiveRecord::Migration
  def change
    create_table :employees_projects do |t|
      t.belongs_to :employee
      t.belongs_to :project
    end
  end
end
