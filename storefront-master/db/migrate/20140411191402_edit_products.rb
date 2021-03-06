class EditProducts < ActiveRecord::Migration
  def change
    remove_column :products, :product_image_file_name
    remove_column :products, :product_image_content_type
    remove_column :products, :product_image_file_size
    remove_column :products, :product_image_updated_at
    add_column :products, :productimage_file_name, :string
    add_column :products, :productimage_content_type, :string
    add_column :products, :productimage_updated_at, :datetime
    add_column :products, :productimage_file_size, :integer
  end
end
