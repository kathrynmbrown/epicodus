require 'spec_helper'

describe Phone do
  it { should validate_presence_of :number }
  it { should validate_presence_of :contact_id }

  it { should belong_to :contact }
end  

