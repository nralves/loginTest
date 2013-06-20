class Poster < ActiveRecord::Base
  attr_accessible :block_id, :description, :file, :poster, :name, :poster_id, :lecturer_ids, :votes
  
  belongs_to :block
  has_and_belongs_to_many :lecturers
  
  accepts_nested_attributes_for :lecturers
  
  mount_uploader :file, PdfUploader
  mount_uploader :poster, PosterUploader
end
