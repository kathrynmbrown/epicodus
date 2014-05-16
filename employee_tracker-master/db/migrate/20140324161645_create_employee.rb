class CreateEmployee < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.column :name, :string

      t.timestamps
    end

  end
end
