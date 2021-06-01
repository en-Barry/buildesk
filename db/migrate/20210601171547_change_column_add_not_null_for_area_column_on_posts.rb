class ChangeColumnAddNotNullForAreaColumnOnPosts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :posts, :area, false
  end
end
