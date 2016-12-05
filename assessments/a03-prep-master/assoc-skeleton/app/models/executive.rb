# == Schema Information
#
# Table name: executives
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#

class Executive < ActiveRecord::Base

  has_many :memberships,
  foreign_key: :member_id,
  primary_key: :id,
  class_name: :BoardMembership

  has_many :boards,
  through: :memberships,
  source: :board
end
