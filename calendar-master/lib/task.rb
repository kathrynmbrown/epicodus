class Task < ActiveRecord::Base
  validates :description, { :presence => true }
  has_one :note, { :as => :notable }
end
