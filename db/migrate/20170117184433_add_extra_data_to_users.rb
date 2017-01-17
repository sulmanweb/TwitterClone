class AddExtraDataToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :string
    add_column :users, :location, :string
    add_column :users, :website, :string
    add_column :users, :dob, :date
    # add uniqueness to the username
    add_index :users, :username, unique: true, using: :btree
  end
end
