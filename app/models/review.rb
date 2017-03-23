class Review < ApplicationRecord
  has_many :posts
  has_many :user_favorites
  has_many :members, through: :user_favorites, source: :user
end
