class Answer < ActiveRecord::Base
  validates :content, presence: true
  has_and_belongs_to_many :users
end
