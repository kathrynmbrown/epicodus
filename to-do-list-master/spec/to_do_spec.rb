require 'rspec'
require 'to_do'

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new('buy groceries')
    test_task.should be_an_instance_of Task
  end
  it 'marks a task with an x, once user decides it is complete' do
    test_task = Task.new('buy groceries')
    test_task.completed_task.should eq "x buy groceries"
  end
end
