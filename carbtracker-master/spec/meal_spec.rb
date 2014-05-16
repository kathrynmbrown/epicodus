require 'spec_helper'

describe Meal do
  it { should validate_presence_of :name }
end
