class User < ActiveRecord::Base

  before_save {self.email = email.downcase }

  EMAIL_REGEX =  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, :presence => true
  validates :email, :presence => true
  validates :name, :length => { :in => 1..50 }
  validates :email, :format => { :with => EMAIL_REGEX }
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :password, :length => { :in => 6..10 }
has_secure_password

end
