require './lib/triangles'

@triangle_array = []

def main_menu
  puts "Press 't' to calculate your triangle!"
  puts "Press 'l' to list your triangles!"
  puts "Press 'x' to exit."

  initial_input = gets.chomp
  if initial_input == 't'
    triangle_calc
    puts "\n"
  elsif initial_input == 'l'
    list_triangles
    puts "\n"
  elsif initial_input == 'x'
    puts "Have a nice day!"
  else
    puts "\n"
    puts "Sorry, please enter a valid input."
    main_menu
  end
end

def triangle_calc
  puts "Please enter the first side of your triangle"
  triangle_side1 = gets.chomp.to_i
  puts "First side received!\n\n"
  puts "Please enter the second side of your triangle"
  triangle_side2 = gets.chomp.to_i
  puts "Second side received!\n\n"
  puts "Please enter the third side of your triangle"
  triangle_side3 = gets.chomp.to_i
  puts "Third side received!\n\n"
  @triangle_array << tri = Triangle.new(triangle_side1, triangle_side2, triangle_side3)
  puts "Your triangle type is:"
  puts tri.triangle_type.to_s
  puts "\n\n"
  main_menu
end

def list_triangles
  puts "\n"
  puts "Here's the list of all your triangles:"
  @triangle_array.each do |triangle| puts triangle.triangle_type.to_s
  end
  puts "\n"
  main_menu
end


main_menu




