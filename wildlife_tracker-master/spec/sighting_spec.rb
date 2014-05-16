require 'spec_helper'

describe Sighting do
  it { should validate_presence_of :species_id }
  it { should validate_presence_of :region_id }
  it { should validate_presence_of :time }
  it { should belong_to :species }
  it { should belong_to :region }
end
