class Division < ActiveRecord::Base
  has_many :employees
  has_many :projects, through: :employees

  def self.search(division_name)
    Division.find_by name: division_name
  end

end
