class Employee < ActiveRecord::Base
  belongs_to(:division)
  has_and_belongs_to_many :projects

  def self.search(name)
    Employee.find_by name: name
  end
end
