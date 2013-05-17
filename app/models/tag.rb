class Tag < ActiveRecord::Base
  attr_accessible :name, :post_id
  belongs_to :posts

  validates :name, presence: true
  validates :post_id, presence: true
end
