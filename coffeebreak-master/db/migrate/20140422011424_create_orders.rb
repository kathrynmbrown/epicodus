class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :drink_category
      t.string :name
      t.string :size
      t.string :milk
      t.string :flavor
    end
  end
end
