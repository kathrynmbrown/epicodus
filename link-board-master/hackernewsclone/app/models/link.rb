class Link < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  validates :url, presence: true
  validates :post_date, presence: true
  belongs_to :user
  has_many :comments, as: :commentable
end
