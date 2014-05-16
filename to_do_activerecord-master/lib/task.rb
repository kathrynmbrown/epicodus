class Task < ActiveRecord::Base

  belongs_to :list
  validates :name, :presence => true, :length => { :maximum => 50 }

  before_save :downcase_name

  def self.not_done
    where(:done => false)
  end

private

    def downcase_name
      name.downcase!
    end


end


