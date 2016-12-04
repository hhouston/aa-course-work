class Company < ActiveRecord::Base
  has_many :watch_list_items,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :WatchListItem

  has_one :board,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Board

  belongs_to :exchange,
  foreign_key: :exchange_id,
  primary_key: :id,
  class_name: :Exchange

  has_many :prices,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Company

  has_many(
    :watch_lists,
    through: :watch_list_items,
    source: :watch_list
  )

  has_many(
    :watchers,
    through: :watch_lists,
    source: :user
  )

end
