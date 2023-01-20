# frozen_string_literal: true

class AddCategoryToPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :category, foreign_key: true
  end
end
