class Lecturer < ActiveRecord::Base
  attr_accessible :country, :homepage, :name, :organization, :photo, :resume, :title, :event_ids, :poster_ids, :image 
  
  has_and_belongs_to_many :events
  has_and_belongs_to_many :posters
  
  accepts_nested_attributes_for :events, :posters
  
  mount_uploader :image, AvatarUploader
end
