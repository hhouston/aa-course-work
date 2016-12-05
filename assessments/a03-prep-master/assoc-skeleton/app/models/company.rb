# == Schema Information
#
# Table name: companies
#
#  id            :integer          not null, primary key
#  name          :string
#  website       :string
#  market_cap    :float
#  ticker_symbol :string
#  created_at    :datetime
#  updated_at    :datetime
#  exchange_id   :integer
#

class Company < ActiveRecord::Base

  has_one :board,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Board

  has_many :prices,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Price

  belongs_to :exchange,
  foreign_key: :exchange_id,
  primary_key: :id,
  class_name: :Exchange

  has_many :watch_list_items,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :WatchListItem

  has_many :watch_lists,
  through: :watch_list_items,
  source: :watch_list

  has_many :watchers,
  through: :watch_lists,
  source: :user

end
