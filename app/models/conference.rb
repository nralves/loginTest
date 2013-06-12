class Conference < ActiveRecord::Base
  attr_accessible :begin, :end, :location, :logo, :name
  
  has_many :blocks, :dependent => :destroy
  has_many :news, :dependent => :destroy
  
  mount_uploader :logo, AvatarUploader
  
   def name_and_date
    self.name + ' | ' + self.begin.to_formatted_s(:short)
  end
end
