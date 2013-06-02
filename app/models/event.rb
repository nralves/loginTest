class Event < ActiveRecord::Base
  attr_accessible :begin, :end, :name, :room, :event_id, :lecturer_ids
  
  has_and_belongs_to_many :lecturers
  
    accepts_nested_attributes_for :lecturers
end
