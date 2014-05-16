class Place < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  has_many :reviews
  has_many :users, :through => :reviews
  has_attached_file :housepic,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # validates_attachment_content_type :housepic,
  #                                   :content_type => ["image/jpg", "image/gif", "image/png"],
  #                                   :size => { :in => 0..2.megabytes }
  validates_attachment_file_name :housepic, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
end
