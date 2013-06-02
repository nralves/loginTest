class Conference < ActiveRecord::Base
  attr_accessible :begin, :end, :location, :logo, :name
  
  has_many :events, :dependent => :destroy
end
