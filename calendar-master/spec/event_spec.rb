require 'spec_helper'

describe Event do
  it { should validate_presence_of :description }
  it { should validate_presence_of :start_time }
  it { should validate_presence_of :end_time }
  it { should have_one :note }
  it { should have_one :repetition }
end
