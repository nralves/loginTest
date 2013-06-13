class Poster < ActiveRecord::Base
  attr_accessible :conference_id, :description, :file, :name, :votes
  
  belongs_to :conference
  
  mount_uploader :file, PdfUploader
end
