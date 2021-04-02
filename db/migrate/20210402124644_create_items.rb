class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image
      t.string :price
      t.string :rakuten_url
      t.string :amazon_url

      t.timestamps
    end
  end
end
