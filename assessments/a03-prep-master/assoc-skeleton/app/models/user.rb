class User < ActiveRecord::Base
  has_many :watch_lists,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :WatchList

  
end
