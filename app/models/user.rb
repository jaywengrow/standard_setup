class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email

  validates_presence_of :password, :on => :create

  attr_accessible :email, :password_digest
  attr_accessible :password, :password_confirmation
end
