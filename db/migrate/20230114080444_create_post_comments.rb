# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[7.0]
  def change
    create_table :post_comments do |t|
      t.text :content

      t.timestamps
    end
  end
end
