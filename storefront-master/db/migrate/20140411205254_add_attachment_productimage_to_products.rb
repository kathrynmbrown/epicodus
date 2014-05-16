class AddAttachmentProductimageToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :productimage
    end
  end

  def self.down
    drop_attached_file :products, :productimage
  end
end
