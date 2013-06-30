class Participant < ActiveRecord::Base
  attr_accessible :conference_id, :email
  
  belongs_to :conference
end
