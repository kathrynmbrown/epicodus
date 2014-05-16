require 'spec_helper'

describe Note do
  it { should belong_to :notable }
  it { should validate_presence_of :content }
  it { should ensure_inclusion_of(:notable_type).in_array(%w(event task)) }
  it { should validate_presence_of :notable_type }
end
