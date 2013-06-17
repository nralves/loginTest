class Poster < ActiveRecord::Base
  attr_accessible :conference_id, :description, :file, :poster, :name, :votes
  
  belongs_to :conference
  
  mount_uploader :file, PdfUploader
  mount_uploader :poster, PosterUploader
end
