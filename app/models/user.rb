class User < ActiveRecord::Base
  
  has_many :requests
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :email, :password, :password_confirmation, :name, :title, :organization, :homepage, :photo

  attr_accessor :password
  before_save :prepare_password

  validates_presence_of :email
  validates_uniqueness_of  :email, :allow_blank => true
  validates_format_of :name, :with => /^[-\w\s\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  
  mount_uploader :photo, AvatarUploader
  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_email(login)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
end
