# == Schema Information
#
# Table name: watch_lists
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class WatchList < ActiveRecord::Base

  has_many :watch_list_items,
  foreign_key: :watch_list_id,
  primary_key: :id,
  class_name: :WatchListItem

  belongs_to :user,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: :User

end
