class User < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string, null: false, default: ''

    remove_column :users, :name, :string
    remove_column :users, :email, :string

    add_index :users, :username, unique: true
  end
end
