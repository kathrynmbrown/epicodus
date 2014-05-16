class Session < ActiveRecord::Base
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
