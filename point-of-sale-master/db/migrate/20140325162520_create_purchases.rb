class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.column :product_id, :integer
      t.column :cashier_id, :integer
      t.column :customer_id, :integer

      t.timestamp
    end
  end
end
