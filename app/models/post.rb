class Post < ActiveRecord::Base
  attr_accessible :date, :group_id, :name
  has_many :tasks
  belongs_to :group
end
