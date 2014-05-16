class Note < ActiveRecord::Base
  belongs_to :notable, { :polymorphic => true }
  validates :content, { :presence => true }
  validates :notable_type, { :inclusion => { :in => %w(event task) },
                             :presence => true }
end
