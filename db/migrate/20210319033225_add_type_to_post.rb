class AddTypeToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :type, :integer, default: 0
  end
end
