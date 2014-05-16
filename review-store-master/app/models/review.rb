class Review < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :product
  belongs_to :user
end  