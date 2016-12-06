class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :user_id

      t.timestamps
      add_index :users, :user_id
    end
  end
end
