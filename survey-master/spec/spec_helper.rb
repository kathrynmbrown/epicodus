require 'active_record'
require 'shoulda-matchers'
require 'rspec'

require 'answer'
require 'question'
require 'survey'
require 'surveyee'
require 'result'

# database_configuration = YAML::load(File.open('./db/config.yml'))
# test_configuration = database_configuration["test"]
# ActiveRecord::Base.establish_connection(test_configuration)

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])


RSpec.configure do |config|
  config.after(:each) do
    Survey.all.each { |survey| survey.destroy }
    Question.all.each { |question| question.destroy }
    Answer.all.each { |answer| answer.destroy }
    Result.all.each { |result| result.destroy }
    Surveyee.all.each {|surveyee| surveyee.destroy }
  end
end
