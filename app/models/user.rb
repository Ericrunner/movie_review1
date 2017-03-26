class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews
  has_many :user_favorites
  has_many :my_favorites, :through => :user_favorites, :source => :review
  def is_favorites_of?(review)
     my_favorites.include?(review)
  end

  def join!(review)
     my_favorites << review
  end

  def quit!(review)
     my_favorites.delete(review)
  end
end
