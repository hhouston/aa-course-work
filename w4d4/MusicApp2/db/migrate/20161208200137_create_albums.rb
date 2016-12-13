class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.integer :yr
      t.integer :band_id
      t.timestamps null: false
    end

    add_index :albums, :name
    add_index :albums, :band_id
  end
end
