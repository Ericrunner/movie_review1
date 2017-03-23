class CreateUserFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :user_favorites do |t|
      t.integer :review_id
      t.integer :user_id

      t.timestamps
    end
  end
end
