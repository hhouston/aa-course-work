class WatchListItem < ActiveRecord::Base

  belongs_to :watch_list,
  foreign_key: :watch_list_id,
  primary_key: :id,
  class_name: :WatchList

  has_one :company,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Company
end
