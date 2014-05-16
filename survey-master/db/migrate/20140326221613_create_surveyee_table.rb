class CreateSurveyeeTable < ActiveRecord::Migration
  def change
    create_table :surveyee_tables do |t|
      t.column :name, :varchar
      t.column :phone, :int
      t.column :city, :varchar

      t.timestamps
    end
  end
end
