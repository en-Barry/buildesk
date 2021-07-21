class ChangeColumnNullTrueForEmailOnUsers < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :email, :string, null: false, default: ''
    remove_index :users, :email
  end

  def down
    change_column :users, :email, :string, null: true
  end
end
