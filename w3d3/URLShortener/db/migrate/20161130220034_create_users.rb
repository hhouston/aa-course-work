class CreateUsers < ActiveRecord::Migration
  def change
    # each time when we want to add a column to table
    create_table :users do |t|
      t.string :email, null: false
      t.timestamps
    end
    # this line gives all the symbol of rows for the single column
    add_index :users, :email, unique: true
  end
end
