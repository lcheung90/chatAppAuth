class User < ActiveRecord::Base
  attr_accessible :password,:password_confirmation, :username
  has_secure_password
  validates_confirmation_of :password
  validates_presence_of :password, :on =>:create
  validates_presence_of :username
  validates_uniqueness_of :username
end
