require 'pg'
require './lib/train'
require './lib/station'
require './lib/stop'

DB = PG.connect({:dbname => 'train_map'})

def title
  puts "Welcome to Your City's Interactive Train Map"
  main_menu
end

def main_menu
  puts "Press 'o' if you are a train operator"
  puts "Press 'r' if you are a train rider"
  puts "Press 'x' to Exit the System"
  main_input = gets.chomp.to_s
  case main_input
  when "o"
    operator_menu
  when "r"
    rider_menu
  when "x"
    exit
  else
    main_menu
  end
end

def rider_menu
  puts "\n\nWelcome to the Rider Menu"
  puts "To view a train line, select 't'"
  puts "To return to the main menu, press 'm'"
  selection = gets.chomp
  case selection
  when 't'
    view_line
  when 'm'
    main_menu
  else rider_menu
end


end

def operator_menu
  puts "Press 's' to add a train station"
  puts "Press 'l' to add a train line"
  puts "Press v to view stored information"
  main_operator_input = gets.chomp.to_s
  case main_operator_input
  when 's'
    add_train_station
  when 'l'
    add_train_line
  when 'v'
    select_view
  else
    main_menu
  end
end

def add_train_station
  puts "Enter the Name of the Train Station:"
  new_station = gets.chomp
  new_station = Station.new(new_station)
  new_station.save
  puts 'The Station- ' +  Station.all[-1].name + ' has been added to the Directory of Stations'
  puts "\n\n"

  station_result = Stops.find_station_id(new_station)

  puts "Type the name of a train that goes to this station:"
  train_name = gets.chomp
# train_result =
  Stops.find_trains_id(train_name)


  puts "Type the time that the train passes through in the morning:"
  train_time = gets.chomp


  # new_station =
  Stops.new(train_result, station_result, train_time)
  new_station.save






  puts "To View All Stations, Select 'v'"
  selection = gets.chomp
  case selection
  when 'v'
    view_stations
  else
    main_menu
  end
  main_menu
end

def add_train_line
  puts "Enter the Train Line:"
  new_line = gets.chomp
  new_line = Train.new(new_line)
  new_line.save
  puts 'You have added the ' + Train.all[-1].name + ' to the Directory of Train Lines'
  puts "\n\n"
  puts "To View All Train Lines, Select 'v'"
  selection = gets.chomp
  case selection
  when 'v'
    view_line
  else
  main_menu
end
main_menu
end

def select_view
  puts "View Stations or Lines?"
  puts "Select 's' for Stations or 'l' for Lines"
  selection = gets.chomp
  case selection
  when 's'
    view_all_stations
  when 'l'
    view_all_lines
  else
    select_view
  end
end

def view_all_stations
  Station.all.each do |station|
    print "#{station.name}\n\n"
  end
  main_menu
end

def view_all_lines
  Train.all.each do |train|
    print "#{train.name}\n\n"
  end
  main_menu
end

def view_line
 #puts "These are all of the Trains:  Select a Train to View All Station Stops for that Line"
    Train.all.each_with_index do |train, index|
      puts "#{index+1}. #{train.name}"
    end
    puts "Type the number of the train that you would like to see the lines for:"
    rider_selection = gets.chomp.to_i
    current_train = Train.all[rider_selection-1]
    current_train.get_stations
end



title

