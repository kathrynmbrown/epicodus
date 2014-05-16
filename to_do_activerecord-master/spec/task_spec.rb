require 'spec_helper'

describe Task do

  it { should belong_to :list }

  it { should validate_presence_of :name }

  it { should ensure_length_of(:name).is_at_most(50) }

  it 'can return the incomplete tasks' do
    not_done_tasks = (1..2).to_a.map do |number|
      Task.create(:name => "task #{number}", :done => false)
    end
    done_task = Task.create(:name => 'done task', :done => true)
    Task.not_done.should eq not_done_tasks
  end

  it 'converts the name to lowercase' do
    task = Task.create(:name => 'FINALGE THE BUFFALO')
    task.name.should eq "finalge the buffalo"
  end

end
