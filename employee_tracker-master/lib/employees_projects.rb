class Employees_projects < ActiveRecord::Base
  belongs_to :employee
  belongs_to :project
end
