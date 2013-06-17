class Event < ActiveRecord::Base
  attr_accessible :name, :abstract, :event_id, :lecturer_ids, :block_id, :file
  
  has_and_belongs_to_many :lecturers
  belongs_to :block
  
    accepts_nested_attributes_for :lecturers
	
	mount_uploader :file, PdfUploader
end
