class Email < ActiveRecord::Base
  attr_accessible :activation, :confirmed, :email
  
  
  belongs_to :user
end
