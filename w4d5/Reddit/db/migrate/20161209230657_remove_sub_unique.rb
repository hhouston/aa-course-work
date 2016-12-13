class RemoveSubUnique < ActiveRecord::Migration
  def change
    remove_index :posts, :sub_id
  end
end
