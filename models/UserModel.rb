class User < ActiveRecord::Base

  has_secure_password
  has_many :drinks
  has_many :favorites

end
