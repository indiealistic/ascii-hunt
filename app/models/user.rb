class User < ApplicationRecord
  has_many :shits
  has_many :comments
  has_many :likes
  has_secure_password
  validates :username, :uniqueness => true, :presence => true
end
