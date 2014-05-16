class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :product
      t.belongs_to :user
      t.string :title
      t.text :content
      t.integer :rating
      t.timestamps
    end
  end
end
