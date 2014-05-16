class AddDivisionIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :division_id, :integer
  end
end
