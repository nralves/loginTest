class Request < ActiveRecord::Base

  belongs_to :user

  attr_accessible :requester_id, :user_id
end
