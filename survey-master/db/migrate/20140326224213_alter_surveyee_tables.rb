class AlterSurveyeeTables < ActiveRecord::Migration
  def change
    rename_table :surveyee_tables, :surveyees
  end
end
