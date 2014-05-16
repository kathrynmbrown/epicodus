class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "sad_panda.jpg"
  has_and_belongs_to_many :users

  validates :description, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
