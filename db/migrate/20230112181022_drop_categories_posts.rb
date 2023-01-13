class DropCategoriesPosts < ActiveRecord::Migration[7.0]
  def change
    drop_table :categories_posts
  end
end
