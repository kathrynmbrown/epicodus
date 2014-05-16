class Event < ActiveRecord::Base
  validates :description, { :presence => true }
  validates :start_time, { :presence => true }
  validates :end_time, { :presence => true }
  validates_datetime :end_time, { :after => :start_time }
  has_one :note, { :as => :notable }
  has_one :repetition

end
