require 'rspec'
require 'pg'
require './lib/station'
require './lib/train'
require './lib/stop'


DB = PG.connect({:dbname => 'train_map_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM trains *;")
  end
end

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
  end
end
