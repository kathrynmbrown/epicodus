require 'spec_helper'

describe Result do
  it { should belong_to :surveyee }
  it { should belong_to :answer }
  it { should belong_to :question }
end
