class Lesson < ActiveRecord::Base

  validates :name, :presence => true

  # before_save do |lesson|
  #   if lesson.sequence_id.exist?
  #     self.renumber
  #   end

  # def self.renumber

  # end
end

