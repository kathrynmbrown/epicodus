class Project < ActiveRecord::Base
   has_and_belongs_to_many :employees
   has_many :divisions, through: :employees

  def self.search(project_name)
    Project.find_by name: project_name
  end

end
