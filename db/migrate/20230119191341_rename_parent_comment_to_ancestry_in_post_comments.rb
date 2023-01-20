# frozen_string_literal: true

class RenameParentCommentToAncestryInPostComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :post_comments, :parent_comment, :ancestry
  end
end
