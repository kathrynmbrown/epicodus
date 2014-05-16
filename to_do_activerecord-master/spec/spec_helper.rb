require 'active_record'
require 'rspec'
require 'shoulda-matchers'

require 'task'
require 'list'

database_configuration = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Task.all.each { |task| task.destroy }
  end
end
