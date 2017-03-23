class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :comment
      t.integer :review_id
      t.integer :user_id

      t.timestamps
    end
  end
end
