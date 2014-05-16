require 'rspec'
require 'parcels'

describe Parcel do
  it 'is initialized with a box dimensions and weight' do
    test_Parcel = Parcel.new(3,4,5,2)
    test_Parcel.should be_an_instance_of Parcel
  end
  it 'calculates the volume of the parcel' do
    test_Parcel = Parcel.new(3,4,5,2)
    test_Parcel.volume.should eq 60
  end
  it 'returns costs based on a volume and weight formula' do
    test_Parcel = Parcel.new(3,4,5,2)
    test_Parcel.cost_to_ship.should eq 120
  end
end
