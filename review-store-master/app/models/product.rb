class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  has_attached_file :product_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :product_image, :content_type => /\Aimage\/.*\Z/
  has_many :reviews 
  has_many :users, through: :reviews   
end  