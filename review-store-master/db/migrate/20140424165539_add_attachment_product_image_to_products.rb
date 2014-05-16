class AddAttachmentProductImageToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :product_image
    end
  end

  def self.down
    drop_attached_file :products, :product_image
  end
end
