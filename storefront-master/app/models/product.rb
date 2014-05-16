class Product < ActiveRecord::Base

  validates :name, :presence => true
  validates :description, presence: true
  validates :price, presence: true
  has_attached_file :productimage, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://lolfunnymeme.com/wp-content/uploads/sadpanda.jpg"
  validates_attachment_file_name :productimage, :matches => [/png\Z/, /jpe?g\Z/]
  # validates_attachment_content_type :productimage,
  #                                   :content_type => ["image/jpg", "image/gif", "image/png"],
  #                                   :size => { :in => 0..2.megabytes }
end
