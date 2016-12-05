# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Board < ActiveRecord::Base

  has_many :memberships,
  foreign_key: :board_id,
  primary_key: :id,
  class_name: :BoardMembership

  belongs_to :company,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Company

  has_many :members,
  through: :memberships,
  source: :member

  has_one :exchange,
  through: :company,
  source: :exchange
end
