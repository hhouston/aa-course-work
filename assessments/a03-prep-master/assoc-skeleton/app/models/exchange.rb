class Exchange < ActiveRecord::Base

  has_many :companies,
  foreign_key: :exchange_id,
  primary_key: :id,
  class_name: :Company
end
