class Phone < ActiveRecord::Base 
  belongs_to :contact

  validates :number, :presence => true
  validates :contact_id, :presence => true

end

