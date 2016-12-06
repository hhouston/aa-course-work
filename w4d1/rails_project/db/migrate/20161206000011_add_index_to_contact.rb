class AddIndexToContact < ActiveRecord::Migration[5.0]
  def change
    add_index :contacts, :user_id
  end
end
