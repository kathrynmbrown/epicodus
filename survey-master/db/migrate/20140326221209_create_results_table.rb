class CreateResultsTable < ActiveRecord::Migration
  def change
    create_table :results_tables do |t|
      t.column :answer_id, :int
      t.column :question_id, :int
      t.column :surveyee_id, :int

      t.timestamps
    end
  end
end
