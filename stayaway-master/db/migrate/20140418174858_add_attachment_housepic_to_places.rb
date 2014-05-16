class AddAttachmentHousepicToPlaces < ActiveRecord::Migration
  def self.up
    change_table :places do |t|
      t.attachment :housepic
    end
  end

  def self.down
    drop_attached_file :places, :housepic
  end
end
