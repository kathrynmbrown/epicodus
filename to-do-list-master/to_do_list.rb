require './lib/to_do'

@list = []

def main_menu
  puts "Press 'a' to add a task"
  puts "Press 'l' to list all of your tasks."
  puts "Press 'x' to exit."
  main_choice = gets.chomp
  # case main_choice
  # when 'a'
  #   #do something
  # when 'l'
  #   #do something else
  # end
  if main_choice == 'a'
    add_task
  elsif main_choice == 'l'
    list_tasks
  elsif main_choice == 'x'
    puts "Good-bye!"
  else
    puts "Sorry, that wasn't a valid option."
    main_menu
  end
end

def add_task
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  @list << Task.new(user_description)
  puts "Task added.\n\n"
  main_menu
end

def list_tasks
  puts "Here are all of your tasks:"
  @list.each do |task|
    puts task.description
  end
  puts "\n"
  puts "Have you completed a task?"
  puts "Press 'y' for yes or 'n' for no."
  answer = gets.chomp
  if answer == 'y'
    puts "Which task have you completed?"
    @list.each do |task|
    puts task.description
    end
    user_completed = gets.chomp
    # if @list.include? user_completed
    #   remove.user_completed
    else
      main_menu
    end
  elsif answer == 'n'
    main_menu
  end
  main_menu
end

def updated_tasks
  puts "Which tasks have you completed?"
  @list.each do |task|
    puts task.description
  end
  puts "\n"
  @list.class
  completed = gets.chomp
  @list.delete(completed)
  puts "Here are your remaining task to complete:"
  puts @list
  main_menu
end
main_menu
