class User < ActiveRecord::Base
  attr_accessible :name, :password_digest, :password
  has_secure_password

  before_save { |user| user.name = name.downcase }
  validates :name, uniqueness: { case_sensitive: false }

end
