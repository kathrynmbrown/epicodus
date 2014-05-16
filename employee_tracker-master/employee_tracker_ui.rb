require 'active_record'
require './lib/project'
require './lib/division'
require './lib/employee'
require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)


def welcome
  puts "Welcome to your employee tracker!"
  menu
end

def menu
  puts "Press 'e' to enter the employee portal",
  "Press 'p' to enter the project portal",
  "Press 'd' to enter the division portal",
  "Press 'x' to exit"
  user_input = gets.chomp
  case user_input
  when 'e'
    employee_portal
  when 'p'
    project_portal
  when 'd'
    division_portal
  when 'x'
    exit
  end
end

def employee_portal
  puts "Press 'a' to add an employee",
  "Press 'u' to update an employee",
  "Press 'l' to list all employees",
  "Press 'd' to delete an employee",
  "Press 'm' to return to the main menu"
  user_input = gets.chomp
  case user_input
  when 'a'
    add_employee
  when 'u'
    update_employees
  when 'l'
    list_employees
  when 'd'
    delete_employee
  when 'm'
    menu
  end
end

def project_portal
  puts "Press 'a' to add a project",
  "Press 'u' to update a project",
  "Press 'l' to list all projects",
  "Press 'd' to delete a project",
  "Press 'm' to return to the main menu"
  user_input = gets.chomp
  case user_input
  when 'a'
    add_project
  when 'u'
    update_projects
  when 'l'
    list_projects
  when 'd'
    delete_project
  when 'm'
    menu
  end
end

def division_portal
  puts "Press 'a' to add a division",
  "Press 'u' to update a division",
  "Press 'l' to list all divisions",
  "Press 'd' to delete a division",
  "Press 'm' to return to the main menu"
  user_input = gets.chomp
  case user_input
  when 'a'
    add_division
  when 'u'
    update_divisions
  when 'l'
    list_divisions
  when 'd'
    delete_division
  when 'm'
    menu
  end
end

# employee methods

def add_employee
  puts "Enter the name of your employee"
  employee_name = gets.chomp
  puts "Enter the name of #{employee_name}'s Division"
  division_of_employee = gets.chomp
  division = Division.search(division_of_employee)
  employee = division.employees.new({:name => employee_name, :division_id => division.id})
  division.save
  puts "'#{employee_name}' has been added to your employee list."
  menu
end

def list_employees
  puts "Here is your list of your employees:"
  employees = Employee.all
  employees.each { |employee| puts employee.name }
  menu
end

def update_employees
  puts "Enter the name of the employee you want to update"
  employee_to_update = gets.chomp
  puts "Enter the employee's updated name"
  updated_employee = gets.chomp
  Employee.all.each do |employee|
    if employee.name == employee_to_update
     employee.update_attribute(:name, updated_employee)
    end
  end
  employee_portal
end

def delete_employee
  puts "Enter the name of the employee to be deleted"
  del_employee = gets.chomp
  employee = Employee.search(del_employee)
  employee.destroy
  menu
end

# project methods

def add_project
  puts "Enter the name of the project"
  project_name = gets.chomp
  puts "Enter the name of the employee assigned to this project:"
  employee_of_project = gets.chomp
  employee = Employee.search(employee_of_project)
  project = employee.projects.new({:name => project_name, :employee_id => employee.id})
  employee.save
  "'#{project_name}' has been added to your projects list."
  menu
end

def add_employee
  puts "Enter the name of your employee"
  employee_name = gets.chomp
  puts "Enter the name of #{employee_name}'s Division"
  division_of_employee = gets.chomp
  division = Division.search(division_of_employee)
  employee = division.employees.new({:name => employee_name, :division_id => division.id})
  division.save
  puts "'#{employee_name}' has been added to your employee list."
  menu
end

def list_projects
  puts "Here is your list of your projects:"
  projects = Project.all
  projects.each { |project| puts project.name}
  puts "Type the name of the project to see all employees working on that project."
  project = gets.chomp
  project = Project.search(project)
  project.employees.each { |employee| puts employee.name }
  menu
end

def update_projects
  puts "Enter the name of the project you want to update:"
  project_to_update = gets.chomp
  puts "Enter the name of the employee you want to add to the project:"
  new_employee = gets.chomp
  new_employee = Employee.search(new_employee)
  project_to_update = Project.search(project_to_update)
  new_employee.projects << project_to_update
  project_portal
end

def delete_project
  puts "Enter the name of the project to be deleted"
  del_project = gets.chomp
  project = Project.search(del_project)
  project.destroy
end

# division methods

def add_division
  puts "Enter the name of your division"
  division_name = gets.chomp
  division = Division.new({:name => division_name})
  division.save
  "'#{division_name}' has been added to your division list."
  menu
end

def list_divisions
  puts "Here is your list of your divisions:"
  divisions = Division.all
  divisions.each { |division| puts division.name}
  puts "Type the name of the division to see all employees in that division."
  user_input = gets.chomp
  division = Division.search(user_input)
  division.employees.each { |employee| puts employee.name}
  menu
end

def update_divisions
  puts "Enter the name of the division you want to update"
  division_to_update = gets.chomp
  puts "Enter the division's updated name"
  updated_division = gets.chomp
  Division.all.each do |division|
    if division.name == division_to_update
      division.update_attribute(:name, updated_division)
    end
  end
  division_portal
end


def delete_division
  puts "Enter the name of the division to be deleted"
  del_division = gets.chomp
  division = Division.search(del_division)
  division.destroy  menu
end





welcome
