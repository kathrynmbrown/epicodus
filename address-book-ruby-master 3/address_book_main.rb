require './lib/contact'
require './lib/phone'
require './lib/email'
require './lib/address'

# @contact = []

def main
  puts "Press 'a' to add a contact or 'l' to view list of contacts"
  puts "Press 'x' to exit"
  main_choice = gets.chomp
  case main_choice
  when 'a'
    add_contact
  when 'l'
    view_contacts
  when 'x'
    exit
  end
main
end

def add_contact
  puts "What is contact's name?"
  user_name = gets.chomp
  Contact.create(user_name)
  puts "Name added!\n\n"
  main
end

def list_contact
  Contact.contacts.each_with_index do |name, index|
    puts (index+1).to_s + ": " + name.name
  end
end

def view_contacts
  select_contact
end

def select_contact
  puts "Which contact would you like to edit or view? Select the number."
  list_contact
  user_input = gets.chomp.to_i
  contact_menu(Contact.contacts[user_input-1])
end

def contact_menu(contact)
  puts "Press 'a' to add information for your contact"
  puts "Press 'v' to see contacts information"
  puts "Press 'x' to exit"
  main_choice = gets.chomp
  case main_choice
  when 'a'
    add_info(contact)
  when 'v'
    info_list(contact)
  when 'x'
    exit
  end
end

def add_info(contact)
  puts "Phone Number: "
  user_phone = gets.chomp
  puts "Number added! How about their email address? \n\n"
  puts "Email Address: "
  user_email = gets.chomp
  puts "Number added! How about their physical address? \n\n"
  puts "Address: "
  user_address = gets.chomp
  puts "Address added! Thanks so much! \n\n"
  contact.add_info(user_phone, user_email, user_address)
  puts "Contact updated! \n\n"
  main
end

def info_list(contact)
  contact.info_list.each_with_index do |info, index|
    puts (index+1).to_s + ": " + info +  "\n"
  end
end
main
