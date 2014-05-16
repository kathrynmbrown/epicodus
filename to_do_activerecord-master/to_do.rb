require 'active_record'
require './lib/task'

database_configuration = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Evernote Watch Out"
  menu
end

def menu
  choice = nil
  until choice == 'e'
    puts "\n\n\tA: Add a task",
        "\tL: List your tasks",
        "\tD: Mark a task complete",
        "\tE: Exit program"
        choice = gets.chomp
        case choice
        when 'a'
          add
        when 'd'
          mark_done
        when 'l'
          list
        when 'e'
          puts "Sayonara!"
        else
          puts "Downloading virus..."
        end

  end
end

def add
  puts "Enter new task: "
  task_name = gets.chomp
  task = Task.new(name: task_name, done: false)
  if task.save
    puts "'#{task.name}' has been added to your To Do list."
  else
  puts "Not a valid option:"
  task.errors.full_messages.each { |message| puts message}
  end
end

def list
  puts "\nMaster list of tasks: ", "*"*30
  tasks = Task.not_done
  tasks.each { |task| puts "\t" + task.name }

end

def mark_done
  puts "Which of these tasks did you complete?", "-"*40
  Task.all.each { |task| puts "\t" + task.name }
  done_task_name = gets.chomp
  done_task = Task.where(:name => done_task_name).pop
  done_task.update_attributes(:done => true)
  puts "\n\tThe task " + "'" + done_task_name + "'" + " has been marked as complete!\n\n"
end

welcome
