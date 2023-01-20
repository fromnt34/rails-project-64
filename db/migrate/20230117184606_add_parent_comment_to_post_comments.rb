# frozen_string_literal: true

class AddParentCommentToPostComments < ActiveRecord::Migration[7.0]
  def change
    add_column :post_comments, :parent_comment, :string
    add_index :post_comments, :parent_comment
  end
end
