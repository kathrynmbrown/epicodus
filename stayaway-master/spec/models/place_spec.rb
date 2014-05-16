require 'spec_helper'

describe Place do
  it { should belong_to :user }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should have_attached_file(:housepic) }
end
