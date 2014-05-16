require 'spec_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should have_one :note }
end
