# == Schema Information
#
# Table name: watch_list_items
#
#  id            :integer          not null, primary key
#  company_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#  start_date    :date
#  end_date      :date
#  watch_list_id :integer
#

class WatchListItem < ActiveRecord::Base

  belongs_to :watch_list,
  foreign_key: :watch_list_id,
  primary_key: :id,
  class_name: :WatchList


  belongs_to :company,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Company

end
