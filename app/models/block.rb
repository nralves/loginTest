class Block < ActiveRecord::Base
  attr_accessible :begin, :conference_id, :end, :name, :room
  
  belongs_to :conference
  has_many :events
end
