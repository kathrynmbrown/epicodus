require 'spec_helper'

describe Repetition do
  it { should belong_to :event }
  it { should ensure_inclusion_of(:repeat_interval).in_array(%w(day week month year)) }
  it { should validate_presence_of :repeat_interval }
end
