class Question < ActiveRecord::Base
  validates :content, presence: true
  belongs_to :answer
  belongs_to :user
end
