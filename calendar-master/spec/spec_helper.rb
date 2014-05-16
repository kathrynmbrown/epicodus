require 'bundler/setup'
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

database_configurations = YAML::load(File.open('./db/config.yml'))
ActiveRecord::Base.establish_connection(database_configurations['test'])

I18n.enforce_available_locales = false

RSpec.configure do |config|
  config.after(:each) do
    Event.all.each { |event| event.destroy }
    Task.all.each { |task| task.destroy }
    Note.all.each { |note| note.destroy }
    Repetition.all.each { |repetition| repetition.destroy }
  end
end
