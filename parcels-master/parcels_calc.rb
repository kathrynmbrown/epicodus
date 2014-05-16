require './lib/parcels'


def main_menu
  puts "Enter your parcel length"
    length_input = gets.chomp.to_i
    puts "Length added.\n\n"
  puts "Enter your parcel height"
    height_input = gets.chomp.to_i
    puts "Height added.\n\n"
  puts "Enter your parcel width"
    width_input = gets.chomp.to_i
    puts "Width added.\n\n"
  puts "Enter your parcel weight"
    weight_input = gets.chomp.to_i
    puts "Weight added.\n\n"
    p = Parcel.new(length_input, height_input, width_input, weight_input)
# end

# def calculator
  puts "Here's your shipping quote!"
  puts "$" + p.cost_to_ship.to_s
  puts "\n"

end
main_menu


