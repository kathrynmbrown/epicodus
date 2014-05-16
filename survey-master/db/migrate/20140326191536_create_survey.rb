class CreateSurvey < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.column :name, :varchar
      t.column :owner, :varchar

      t.timestamps
    end
  end
end
