class Like < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :beet, :optional => true
end
