class WatchList < ActiveRecord::Base

  belongs_to :user,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :User

  has_many :watch_list_items,
  foreign_key: :watch_list_id,
  primary_key: :id,
  class_name: :WatchListItem
end
