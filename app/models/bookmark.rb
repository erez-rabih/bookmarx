class Bookmark < ActiveRecord::Base
  attr_accessible :address, :user_id

  belongs_to :user
  validates :address, :user_id, :presence => true
end
