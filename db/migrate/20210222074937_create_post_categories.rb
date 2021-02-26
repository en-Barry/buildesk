class CreatePostCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :post_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end

    add_index :post_categories, %i[category_id post_id], unique: true
  end
end
