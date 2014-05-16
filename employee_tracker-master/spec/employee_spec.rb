require 'spec_helper'

describe Employee do
  it { should have_and_belong_to_many :projects }
end
