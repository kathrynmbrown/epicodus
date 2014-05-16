require 'spec_helper'

describe Task do
	it 'is initialized with a name' do
		task = Task.new('learn SQL', 1)
		task.should be_an_instance_of Task
	end

	it 'tells you its name' do
		task = Task.new('learn SQL', 1)
		task.name.should eq 'learn SQL'
	end

	it 'starts off with no tasks' do
		Task.all.should eq []
	end

	it 'lets you save tasks to the database' do
		task = Task.new('learn SQL', 1)
		task.save
		Task.all.should eq [task]
	end

	it 'is the same task if it has the same name' do
		task1 = Task.new('learn SQL', 1)
		task2 = Task.new('learn SQL', 1)
		task1.should eq task2
	end
end


describe List do
	it 'is initialized with a name' do
		list = List.new('Epicodus stuff')
		list.should be_an_instance_of List

	end

	it 'tells you its name' do
		list = List.new('Epicodus stuff')
		list.name.should eq 'Epicodus stuff'
	end

	it 'is the same list if it has the same name' do
		list1 = List.new('Epicodus stuff', 1)
		list2 = List.new('Epicodus stuff', 1)
		list1.should eq list2
	end

	it 'starts off with no lists' do
		List.all.should eq []
	end

	it 'lets you save lists to the database' do
		list = List.new('learn SQL')
		list.save
		List.all.should eq [list]
	end

	it 'sets its ID when you save it' do
		list = List.new('learn SQL')
		list.save
		list.id.should be_an_instance_of Fixnum
	end

	it 'can be initialized with it database ID' do
		list = List.new('Epicodus stuff', 1)
		list.should be_an_instance_of List
	end

	it 'returns the tasks associated with a list id' do
			list = List.new("This is awesome", 1)
			task1 = Task.new('say hi', 1)
			task2 = Task.new('make a program', 1)
			list.tasks(1).should eq [task1, task2]
		end

end











