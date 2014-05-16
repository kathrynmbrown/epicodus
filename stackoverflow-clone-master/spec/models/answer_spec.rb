require 'spec_helper'

describe Answer do
  it { should validate_presence_of :content }
  it { should have_and_belong_to_many :users }

end
