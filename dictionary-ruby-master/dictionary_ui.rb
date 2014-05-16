require './lib/term'

def main_menu
  system 'clear'
  puts "Main Menu------"
  puts "Press 'a' to create a new term or 'l' to list all of your words."
  puts "Press 's' to search the dictionary"
  puts "Type a word to display its definition"
  puts "Press 'x' to exit"
  main_choice = gets.chomp
  case main_choice
  when 'a'
    add_term
  when 'l'
    list_menu
  when 's'
    search_term
  when 'x'
    exit
  end
  main_menu
end

def search_term
  puts "Type the word to search."
  word_search = gets.chomp.to_s
  if Term.search(word_search) == nil
    puts "Sorry that word is not in the dictionary"
  else
    searched_term = Term.search(word_search)
    puts searched_term.full_entry
  end
  puts "Search another word? y/n"
  search_answer = gets.chomp.to_s
  case search_answer
  when 'y'
    search_term
  when 'n'
    main_menu
  end
end

def add_term
  puts "Please enter a word to define:"
  word = gets.chomp.to_s
  puts "Enter your definition for #{word}:"
  definition = gets.chomp.to_s

  new_term = Term.create(word, definition)
  puts "#{new_term.full_entry} has been created"

  list_menu
end

def list_words
  Term.all.each {|object| puts "• " + object.word}
end

def list_menu
  system 'clear'
  puts "List of Terms ----------"
  list_words
  puts "Press 'a' to add another term."
  puts "Type a word to display, edit or delete the term"
  puts "Press 'x' to return to the main menu."
  term_choice = gets.chomp.to_s
  case term_choice
  when 'a'
    add_term
  when 'x'
    main_menu
  else
    if Term.search(term_choice) != nil
      searched_term = Term.search(term_choice)
      puts searched_term.full_entry
      puts "Press 'e' to edit or press 'd' to delete this term."
      input = gets.chomp.to_s
      case input
      when 'd'
        searched_term.delete
        list_menu
      when 'e'
        edit_term(searched_term)
        list_menu
      end
    else
      main_menu
    end
  end
end

def edit_term(term_to_edit)
  puts "Editing #{term_to_edit.full_entry}"
  puts "Do you want to edit the word: #{term_to_edit.word}? y/n"
  input = gets.chomp.to_s.downcase
  case input
  when "y"
    puts "Enter updated word:"
    edited_word = gets.chomp.to_s
  else
    edited_word = term_to_edit.word
  end
  puts "Do you want to edit the definition: #{term_to_edit.definition}? y/n"
  input = gets.chomp.to_s.downcase
  case input
  when "y"
    puts "Enter updated definition:"
    edited_definition = gets.chomp.to_s
  else
    edited_definition = term_to_edit.definition
  end

  term_to_edit.edit(edited_word, edited_definition)
  puts "The edited term is #{term_to_edit.full_entry}"

  list_menu

end

system 'clear'
main_menu
