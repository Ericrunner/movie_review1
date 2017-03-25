class Post < ApplicationRecord
  validates :comment, presence: true
  belongs_to :review
  scope :recent, -> { order("created_at DESC")}
end
