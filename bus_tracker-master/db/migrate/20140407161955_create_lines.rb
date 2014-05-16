class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.column :name, :string
    end
  end
end
