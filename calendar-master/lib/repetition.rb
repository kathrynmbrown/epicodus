class Repetition < ActiveRecord::Base
  belongs_to :event
  validates :repeat_interval, { :inclusion => { :in => %w(day week month year) },
                                :presence => true }
end
