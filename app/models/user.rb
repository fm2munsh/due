class User < ActiveRecord::Base
	attr_accessible :name, :password_digest, :password
	has_secure_password

	has_and_belongs_to_many :groups

	before_save { |user| user.name = name.downcase }
	validates :name, uniqueness: { case_sensitive: false }

end
