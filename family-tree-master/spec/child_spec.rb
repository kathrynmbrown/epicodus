require 'spec_helper'

describe Child do
  it { should belong_to :person}
  it { should belong_to :parent}
end
