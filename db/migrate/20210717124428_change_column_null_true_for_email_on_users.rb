class ChangeColumnNullTrueForEmailOnUsers < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :email, :string, null: false, default: ''
  end

  def down
    change_column :users, :email, :string, null: true
  end
end
