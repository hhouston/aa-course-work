class Price < ActiveRecord::Base
  belongs_to :companies,
  primary_key: :id,
  foreign_key: :company_id,
  class_name: :Company
end
