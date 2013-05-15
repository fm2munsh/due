class Group < ActiveRecord::Base
  attr_accessible :name, :password
  has_and_belongs_to_many :users
end