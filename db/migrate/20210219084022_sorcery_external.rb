class SorceryExternal < ActiveRecord::Migration[6.0]
  def change
    create_table :authentications do |t|
      t.integer :User_id, null: false
      t.string :provider, :uid, null: false

      t.timestamps              null: false
    end

    add_index :authentications, [:provider, :uid]
  end
end
