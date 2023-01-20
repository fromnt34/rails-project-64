# frozen_string_literal: true

class CreateCategoriesPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_posts do |t|
      t.references :category, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
