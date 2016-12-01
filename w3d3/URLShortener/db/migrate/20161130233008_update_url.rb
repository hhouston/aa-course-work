class UpdateUrl < ActiveRecord::Migration
  def change
    add_index :shortened_urls, :long_url 
  end
end
