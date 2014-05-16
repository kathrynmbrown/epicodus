class CreateProductsPurchases < ActiveRecord::Migration
  def change
    create_table :products_purchases do |t|
      t.belongs_to :products
      t.belongs_to :purchases

      t.timestamps
    end
  end
end
