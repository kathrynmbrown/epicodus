require 'spec_helper'

describe Question do
  it { should belong_to :survey }
  it { should have_many :answers }
  it { should have_many :results }
end
