class Review < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  has_many :posts
  has_many :user_favorites
  has_many :members, through: :user_favorites, source: :user
  scope :recent, -> { order("created_at DESC")}
end
