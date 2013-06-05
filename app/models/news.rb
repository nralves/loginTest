class News < ActiveRecord::Base
    attr_accessible :body, :title, :conference_id
  
  
	belongs_to :conference
  
  

  
end
