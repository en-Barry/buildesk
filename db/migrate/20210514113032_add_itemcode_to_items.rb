class AddItemcodeToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :item_code, :string, null: false
  end
end
