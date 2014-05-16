require 'active_record'
require './lib/purchase'
require './lib/product'
require './lib/customer'
require './lib/cashier'
require 'pry'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def welcome
  puts "Welcome to the Point-of-Sale program!"
  main_menu
end

def main_menu
  puts "Press 'sm' if you are a store manager"
  puts "Press 'ca' if you are a cashier"
  puts "Press 'cu' if you are a customer"
  puts "Press 'x' to exit"
  choice = gets.chomp

  case choice
    when 'sm' then store_manager_menu
    when 'ca' then pin_check
    when 'cu' then customer_menu
    when 'x' then "Goodbye!"
    else puts "Sorry, that wasn't a valid option"
      main_menu
  end
end

def store_manager_menu
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add a new product"
    puts "Press 'lp' to list products"
    puts "Press 'up' to update a product"
    puts "Press 'dp' to delete a product"
    puts "Press 'c' to create a cashier"
    puts "Press 'lc' to list cashier"
    puts "Press 'uc' to update a cashier"
    puts "Press 'dc' to delete a cashier"
    puts "Press 'x' to exit"
    choice = gets.chomp

    case choice
      when 'a' then add_product
      when 'lp' then manager_list_products
      when 'up' then update_product
      when 'dp' then delete_product
      when 'c' then create_cashier
      when 'lc' then manager_list_cashiers
      when 'uc' then update_cashier
      when 'dc' then delete_cashier
      when 'x' then puts "Goodbye!"
      else puts "Sorry, that wasn't a valid option"
    end
  end
end


def pin_check
  puts "Please enter your cashier id"
  id_input = gets.chomp.to_i
  puts "Please enter your 4 digit login"
  pin_input = gets.chomp.to_i

  if Cashier.pin_match(id_input, pin_input)
    cashier_menu
  else
    puts "Invalid PIN - try again"
    pin_check
  end
end

def cashier_menu
  choice = nil
  until choice == 'x'
    puts "Press 'p' to complete a purchase transaction"
    puts "Press 'l' to list all of your purchase transactions"
    puts "Press 'm' to modify a purchase transaction"
    puts "Press 'v' void a purchase transaction"
    puts "Press 'x' to exit"

    choice = gets.chomp

    case choice
      when 'p' then purchase_transaction
      when 'l' then cashier_list_purchases
      when 'm' then modify_purchase
      when 'v' then void_purchase
      when 'x' then puts "Goodbye!"
      else puts "Sorry, that wasn't a valid option"
    end
  end
end

def customer_menu
  choice = nil
  until choice == 'x'
    puts "Press 'l' to list all of your purchase transactions"
    puts "Press 'x' to exit"

    choice = gets.chomp

    case choice
      when 'l' then customer_list_purchases
      when 'x' then puts "Goodbye!"
      else puts "Sorry, that wasn't a valid option"
    end
  end
end

# store manager methods  ===============================================

def add_product #in this method, make price a two decimal value
  puts "Enter the name of the product"
  product_name = gets.chomp
  puts "Enter the product's price (0.00)"
  product_price = gets.chomp.split('')
  if product_price [-3] == "."
    product_price = product_price.join('').to_f
    new_product = Product.new({:name => product_name, :price => product_price})
    new_product.save
    puts "\n'#{product_name}' has been saved to inventory\n\n"
  else
    puts "Invalid price! Try again.\n"
    sleep(1)
    add_product
  end
end

def manager_list_products
  puts "Here are all your products"
  list_products
end

def list_products
  Product.all.each { |product| puts "#{product.id}. #{product.name}: #{product.price}" }
  "\n\n"
end

def update_product
  list_products
  puts "Enter the number of the product you want to update:"
  user_input = gets.chomp
  product_to_update = Product.search(user_input)
  puts "#{product_to_update.id}. #{product_to_update.name}: #{product_to_update.price}"
  puts "What would you like to update?\n\n"
  puts "Press 'n' to update the name"
  puts "Press 'p' to update the price"
  puts "Press 'm' to return to the cashier menu"
  choice = gets.chomp

  case choice
    when 'n'
      puts "Please enter the new name of this product"
      new_product_name = gets.chomp
      product_to_update.update(:name => new_product_name)
      puts "#{new_product_name} has been updated!\n\n"
    when 'p'
      puts "Please enter the new price of #{product_to_update.name}"
      new_product_price = gets.chomp
      product_to_update.update(:price => new_product_price)
      puts "#{product_to_update.name}'s price has been updated!\n\n"
    when 'm' then cashier_menu
    else puts "Please enter a valid option!"
      update_cashier
  end
end

def delete_product
  list_products
  puts "Please select the product you would like to delete"
  user_input = gets.chomp
  product_to_delete = Product.search(user_input)
  product_to_delete.destroy
  puts "#{product_to_delete.name} has been deleted from the inventory!\n\n"
end

def create_cashier
  puts "Enter the name of the cashier"
  cashier_name = gets.chomp
  puts "Enter a four digit pin for this cashier"   # how do we limit pin to 4 digits only?
  cashier_pin = gets.chomp.to_i.to_s
  if cashier_pin.length == 4
    cashier_pin.to_i
    new_cashier = Cashier.new({:name => cashier_name, :login => cashier_pin})
    new_cashier.save
    puts "\n'#{cashier_name}' has been added to the roster!\n\n"
  else
    puts "Invalid pin! Try again.\n"
    sleep(1)
    create_cashier
  end
end

def manager_list_cashiers
  puts "Here are all your cashiers"
  list_cashiers
end

def list_cashiers
  Cashier.all.each { |cashier| puts "#{cashier.id}. #{cashier.name}" }
  "\n\n"
end

def update_cashier
  list_cashiers
  puts "Enter the number of the employee you want to update:"
  user_input = gets.chomp
  cashier_to_update = Cashier.search(user_input)
  puts "#{cashier_to_update.id}. #{cashier_to_update.name}: #{cashier_to_update.login}"
  puts "What would you like to update?\n\n"
  puts "Press 'n' to update the name"
  puts "Press 'p' to update the pin"
  puts "Press 'm' to return to the cashier menu"
  choice = gets.chomp

  case choice
    when 'n'
      puts "Please enter the new name of this cashier"
      new_cashier_name = gets.chomp
      cashier_to_update.update(:name => new_cashier_name)
      puts "#{new_cashier_name} has been updated!\n\n"
    when 'p'
      puts "Please enter the new pin of this cashier"
      new_cashier_pin = gets.chomp
      cashier_to_update.update(:login => new_cashier_pin)
      puts "#{cashier_to_update.name}'s pin has been updated!\n\n"
    when 'm' then cashier_menu
    else puts "Please enter a valid option!"
      update_cashier
  end
end


def delete_cashier
  list_cashiers
  puts "Please select the cashier you would like to delete"
  user_input = gets.chomp
  cashier_to_delete = Cashier.search(user_input)
  cashier_to_delete.destroy
  puts "#{cashier_to_delete.name} has been deleted from the roster!\n\n"
end

# cashier methods  ===============================================
def purchase_transaction

end

def cashier_list_purchases

end

def modify_purchase

end

def void_purchase

end
















# customer methods  ===============================================















welcome
