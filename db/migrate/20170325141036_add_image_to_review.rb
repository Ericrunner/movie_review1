class AddImageToReview < ActiveRecord::Migration[5.0]
  def up
    add_attachment :reviews, :avatar
  end
  def down
    remove_attachment :reviews, :avatar
  end
end
