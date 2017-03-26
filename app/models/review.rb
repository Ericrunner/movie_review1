class Review < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :avatar, presence: true
  belongs_to :user
  has_many :posts
  has_many :user_favorites
  has_many :members, through: :user_favorites, source: :user
  scope :recent, -> { order("created_at DESC")}
  has_attached_file :avatar, styles: {medium: "300x300", thumb: "100x100"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
