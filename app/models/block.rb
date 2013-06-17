class Block < ActiveRecord::Base
  attr_accessible :begin, :conference_id, :track_id,:end, :name, :room
  
  belongs_to :conference
  belongs_to :track
  has_many :events
  
  
  def name_and_date
    self.name + ' | ' + self.begin.to_formatted_s(:short)
  end

end
