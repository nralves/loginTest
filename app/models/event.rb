class Event < ActiveRecord::Base
  attr_accessible :begin, :end, :name, :room, :event_id, :lecturer_ids, :conference_id
  
  has_and_belongs_to_many :lecturers
  belongs_to :conference
  
    accepts_nested_attributes_for :lecturers
end
