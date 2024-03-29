class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  attr_accessible :email, :password, :password_confirmation

  has_many :bookmarks

  accepts_nested_attributes_for :bookmarks, :allow_destroy => true
  

end
