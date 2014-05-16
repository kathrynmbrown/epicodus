class AddUserNameToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :user_name, :string
  end
end
