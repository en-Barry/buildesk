class RenameTypeColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :type, :area
  end
end
