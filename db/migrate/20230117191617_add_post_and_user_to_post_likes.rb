# frozen_string_literal: true

class AddPostAndUserToPostLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :post_likes, :post, foreign_key: true
    add_reference :post_likes, :user, foreign_key: true

    add_index :post_likes, %i[post_id user_id], unique: true
  end
end
