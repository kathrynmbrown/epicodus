require 'spec_helper'

describe Station do
  it 'is initialized with a name' do
    station = Station.new('Union Station')
    station.should be_an_instance_of Station
  end
  it 'returns the name of the station' do
    station = Station.new('Union Station')
    station.name.should eq 'Union Station'
  end
  it 'saves and returns all the stations in the database' do
    station = Station.new('Union Station')
    station.save
    Station.all.should eq [station]
  end



end
