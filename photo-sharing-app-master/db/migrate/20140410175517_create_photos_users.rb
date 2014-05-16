class CreatePhotosUsers < ActiveRecord::Migration
  def change
    create_table :photos_users do |t|
      t.integer :photo_id
      t.integer :user_id

      t.timestamps
    end
  end
end
