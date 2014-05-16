class CreateReviewTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :rating
      t.integer :user_id
      t.integer :place_id
      t.string :headline
      t.text :content

      t.timestamps
    end
  end
end
