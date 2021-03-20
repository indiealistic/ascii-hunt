class Beet < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :likes
  has_many :comments
end
