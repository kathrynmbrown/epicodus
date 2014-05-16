require 'spec_helper'

describe Contribution do
  it { should belong_to :project }
  it { should belong_to :employee }
end
