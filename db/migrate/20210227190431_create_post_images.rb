class CreatePostImages < ActiveRecord::Migration[6.0]
  def change
    create_table :post_images do |t|
      t.string :image, null: false
      t.string :caption
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
