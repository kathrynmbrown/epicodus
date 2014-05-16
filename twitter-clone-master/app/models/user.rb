class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
  validates :email, presence: true, uniqueness: true
  validates :handle, presence: true, uniqueness: true

  after_create :send_welcome_message #, other callbacks..


private
  def send_welcome_message
   UserMailer.signup_confirmation(self).deliver
  end


end
