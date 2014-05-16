class User < ActiveRecord::Base
 has_secure_password
 has_many :questions
 has_and_belongs_to_many :answers
 has_many :answers, through: :questions

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            case_sensitive: false
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_digest, presence: true, uniqueness: true
  validates :username, presence: true

end
