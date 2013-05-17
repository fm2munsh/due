class User < ActiveRecord::Base
	attr_accessible :name, :password
	has_secure_password

	has_and_belongs_to_many :groups
	has_and_belongs_to_many :admin_groups, class_name: 'Group', join_table: :admins_groups

	before_save { |user| user.name = name.downcase }
	validates :name, presence: true, uniqueness: { case_sensitive: false }
	validates :password, presence: true
end
