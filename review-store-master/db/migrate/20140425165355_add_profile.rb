class AddProfile < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.string :name
      t.string :website_link
      t.string :twitter_handle
      t.string :headline

      t.timestamps
    end
  end
end
