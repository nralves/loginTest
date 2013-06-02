class Lecturer < ActiveRecord::Base
  attr_accessible :country, :homepage, :name, :organization, :photo, :resume, :title, :event_ids
  
  has_and_belongs_to_many :events
  
  accepts_nested_attributes_for :events
end
