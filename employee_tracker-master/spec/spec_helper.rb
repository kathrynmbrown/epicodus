require 'active_record'
require 'rspec'
require 'shoulda-matchers'


require 'employee'
require 'project'
require 'division'
require 'contribution'


database_configurations = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configurations['test']
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Employee.all.each { |employee| employee.destroy }
    Project.all.each { |project| project.destroy }
    Division.all.each { |division| division.destroy }
  end
end

