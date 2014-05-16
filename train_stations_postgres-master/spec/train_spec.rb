require 'spec_helper'

describe Train do
  it 'is initialized with a name' do
    train = Train.new('G-line')
    train.should be_an_instance_of Train
  end
  it 'returns the name of the train' do
    train = Train.new('G-line')
    train.name.should eq 'G-line'
  end
  it 'saves and returns all the trains in the database' do
    train = Train.new('Betsy Locomotive')
    train.save
    Train.all.should eq [train]
  end
  it 'shows all the stations for a train' do
    test_train = Train.new('Betsey Locomotive', 9)
    test_train.save
    test_train.get_stations.should eq "5 1 2 2014-03-19 04:00:00"
  end

end






#SELECT * FROM stops WHERE station_id = (inputted by user) && train_id = (inputted_by_user); RETUR OBJECT display [time]
