require 'pg'
require './lib/task'
require './lib/list'

DB = PG.connect({:dbname => 'to_do'})

def welcome
	puts "Welcome to the TO DO list!"
	main_menu
end

def prompt
  print '>'
end

def main_menu
  puts "Press 'a' to add a new list"
  puts "Press 'l' to see a list of your tasks"
  puts "Press 'd' to delete a list"
  prompt
  main_menu_input = gets.chomp
  case main_menu_input
  when 'a'
    add_list
  when 'l'
    see_lists
  when 'd'
    delete_task
  else
    puts "Invalid input"
    main_menu
  end
end

def add_list
  puts "Type the name of your new list:"
  new_list = gets.chomp
  new_list = List.new(new_list)
  new_list.save
  puts "Your list #{new_list.name} has been saved!"
  puts "\n\n"
  main_menu
end

def see_lists
  puts "\n\n"
    List.all.each do |list|
      print "#{list.id} #{list.name}\n\n"
      Task.all.each do |task|
        puts "\t#{task.name}"
      end
    end
    puts "\n\n"
    puts "Choose a list to add a task"
    list = gets.chomp
    puts "\n\n"
    main_menu
end

# def add_task
#   puts "Enter your task:"
#   prompt
#   # new_task =Task.new(gets.chomp, )
#   puts "#{new_task} was added to your todo list."
#   main_menu
# end


welcome







