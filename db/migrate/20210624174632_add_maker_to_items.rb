class AddMakerToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :maker, :string
  end
end
