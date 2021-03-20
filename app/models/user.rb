class User < ApplicationRecord
  has_many :beets
  has_many :comments
  has_many :likes
  has_secure_password
  validates :email, :uniqueness => true, :presence => true
end
