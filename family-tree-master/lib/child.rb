class Child < ActiveRecord::Base
  belongs_to :person
  belongs_to :parent

end
