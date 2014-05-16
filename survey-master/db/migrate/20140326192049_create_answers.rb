class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.column :answer_choice, :varchar
      t.column :question_id, :integer

      t.timestamps
    end
  end
end
