class Block < ActiveRecord::Base
  attr_accessible :begin, :conference_id, :end, :name, :room
  
  belongs_to :conference
  has_many :events
  
  
  def name_and_date
    self.name + ' | ' + self.begin.to_formatted_s(:short)
  end

end
