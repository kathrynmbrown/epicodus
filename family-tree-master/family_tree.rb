require 'bundler/setup'
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)
ActiveRecord::Base.extend(Textacular)

def menu
  puts 'Welcome to the family tree!'
  puts 'What would you like to do?'

  loop do
    puts 'Press a to add a family member.'
    puts 'Press b to add a baby'
    puts 'Press l to list out the family members.'
    puts 'Press m to add who someone is married to.'
    puts 'Press s to see who someone is married to.'
    puts "Press lp to list parents"
    puts "Press r to show relations"
    puts 'Press e to exit.'
    choice = gets.chomp

    case choice
    when 'a'
      add_person
    when 'b'
      add_child
    when 'p'
      add_parent
    when 'l'
      list
    when 'm'
      add_marriage
    when 's'
      show_marriage
    when 'lp'
      list_parents
    when 'r'
      show_relations
    when 'e'
      exit
    end
  end
end

def add_person
  puts 'What is the name of the family member?'
  name = gets.chomp
  new_person = Person.create(:name => name)
  puts name + " was added to the family tree.\n\n"
  new_person

end

def add_parent
  puts 'What is the name of the parent?'
  name = gets.chomp
  Parent.create(:name => name)
  puts name + " was added as a parent.\n\n"
end

def add_child
  new_child = add_person
  list
  puts "Enter the name of the child's first parent:"
  parent_to_add = gets.chomp
  daddy_or_mommy = Person.where({:name => parent_to_add})
  already_parent = Parent.where({:name => daddy_or_mommy[0].name})
  if already_parent.length == 0
      add_parent
    else
      puts "Great, you already know the ropes of parenthood!!!!"
  Child.create({:person_id => new_child.id, :parent_id => parent_to_add})
  puts new_child.name + " was added as a child.\n\n"
  puts "Would you like to add another parent?"
  add_another_parent = gets.chomp.upcase
  case add_another_parent
    when "Y"
      puts "Enter the number of the child's second parent:"
      second_parent_to_add = gets.chomp.to_i
      Child.create({:person_id => new_child.id, :parent_id => second_parent_to_add})
      puts "Parent was added as a parent of #{new_child.name}.\n\n"
  end
end
end


def add_marriage
  list
  puts 'What is the number of the first spouse?'
  spouse1 = Person.find(gets.chomp)
  puts 'What is the number of the second spouse?'
  spouse2 = Person.find(gets.chomp)
  spouse1.update(:spouse_id => spouse2.id)
  puts spouse1.name + " is now married to " + spouse2.name + "."
end

def list
  puts 'Here are all your relatives:'
  people = Person.all
  people.each do |person|
    puts person.id.to_s + " " + person.name
  end
  puts "\n"
end

def list_parents
  list
  puts "Enter the number the child to view its parents:"
  child = gets.chomp.to_i
  person_child_matches = Child.where({:person_id => child}) # returns an array of elements in the children table that have the same person_id
  puts "Here is a list of all of the child's parents:"
  parent_finder = person_child_matches.each do |match| # begins a loop through each element in person_child_matches
    parent_matches = Parent.where({:id => match.parent_id})
    parent_matches.each { |parent| puts parent.name}
  end
end

def show_marriage
  list
  puts "Enter the number of the relative and I'll show you who they're married to."
  person = Person.find(gets.chomp)
  spouse = Person.find(person.spouse_id)
  puts person.name + " is married to " + spouse.name + "."
end

def show_relations
  puts "Enter the name of the person that you would like to see relationships for:"
  person_to_search = gets.chomp.titleize
  person_to_look = Person.where({:name => person_to_search})
  person_to_look.each do |i|
    puts "#{i.id} ..... #{i.name}"
  end
  puts "Type the number of the person you would like to see relationships for:"
  person_to_get = gets.chomp.to_i
  current_person = Person.where({:id => person_to_get})
  current_person = current_person[0]
  puts current_person.spouse_id
  all_my_children = Child.where({:parent_id => current_person.id})
  all_my_children.each do |child|
    the_young_and_restless = Person.where({:id => child.person_id})
    the_young_and_restless.each do |index|
      puts index.name
    end
  end
  person = Person.find(person_to_get)
begin
  spouse = Person.find(person.spouse_id)
  puts person.name + " is married to " + spouse.name + "."
rescue
  puts "Looks like they are still a bachelor(ette)"
end

end

menu
