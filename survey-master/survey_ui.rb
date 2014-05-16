require 'active_record'
require './lib/answer'
require './lib/question'
require './lib/survey'
require './lib/surveyee'
require './lib/result'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def main_menu
  puts "*"*40, "MAIN MENU", "*"*40
  choice = nil
  until choice == 'x'

    puts "\t1: Survey Creator",
         "\t2: Survey Taker",
         "\tx: Exit"

    choice = gets.chomp
    case choice

    when '1'
      creator
    when '2'
      taker
    when 'x'
      puts "Goodbye"
    else
      puts "That was not a valid entry. Please try again."
      main_menu
    end
  end
end

def creator
  puts "*"*40, "SURVERY(sic) CREATORS", "*"*40
  puts "\t1: Create a new survey",
       "\t2: List all surveys",
       "\t3: Add questions to a survey"
       "\t4: View survey results"

  choice = gets.chomp
  case choice

  when '1'
    new_survey
  when '2'
    list_surveys
  when '3'
    add_questions_to_existing
  when '4'
    view_results
  when 'x'
    puts "Goodbye"
  else
    puts "Invalid option. Por favor intenta de nuevo"
  end

end

def new_survey
  puts "Enter the title of your new survey:"
  title = gets.chomp
  new_survey = Survey.create({:name => title})
  puts "Your survey '#{title}' has been saved!"
  puts "Press enter to continue"
  gets
  new_question
end

def new_question
  # puts "Question \#{#{index + 1}: "
  puts "Enter Question: "
  question = gets.chomp
  new_question = Question.create({:inquiry => question})
  puts "Your question has been added."
  puts "Would you like to enter another question? Type y or n.\n\n"
  #This loop does not work! Let's figure this out and refactor it, yeah?!
  input = gets.chomp
  if input == 'y'
    new_question
  elsif input == 'n'
    puts "Ok dude\n\n"
  else
    puts "invalid entry. Try again mang."
  end

end

main_menu









