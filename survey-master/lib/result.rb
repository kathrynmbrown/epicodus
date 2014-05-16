class Result < ActiveRecord::Base
  belongs_to :surveyee
  belongs_to :answer
  belongs_to :question
end
