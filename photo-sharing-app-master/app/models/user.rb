class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "sad_panda.jpg"
  has_and_belongs_to_many :photos

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            case_sensitive: false
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_digest, presence: true, uniqueness: true
  validates_attachment_content_type :avatar,
                                    :content_type => ["image/jpg", "image/gif", "image/png"],
                                    :size => { :in => 0..2.megabytes }
  #validates_attachment_size :size => { :in => 0..10.kilobytes }
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
end
