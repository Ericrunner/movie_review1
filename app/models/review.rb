class Review < ApplicationRecord
  has_many :posts
  has_many :user_favorties
  has_many :members, through: :user_favorties, source: :user
end
