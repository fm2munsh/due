class Post < ActiveRecord::Base
  attr_accessible :date, :group_id, :name
  has_many :tags
  belongs_to :group

  validates :group_id, presence: true
  validates :name, presence: true
  # validates :date, presence: true
end
