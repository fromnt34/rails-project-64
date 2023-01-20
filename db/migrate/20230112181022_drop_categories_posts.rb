# frozen_string_literal: true

class DropCategoriesPosts < ActiveRecord::Migration[7.0]
  def change
    drop_table :categories_posts do |t|
      t.reference :category
      t.reference :post
    end
  end
end
