class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :description, :text
    add_column :users, :image, :string
    add_column :users, :role, :integer, default: 0, null: false
  end
end
