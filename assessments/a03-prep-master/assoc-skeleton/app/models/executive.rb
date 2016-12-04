class Executive < ActiveRecord::Base

  has_many :board_memberships,
  class_name: :BoardMembership,
  foreign_key: :member_id,
  primary_key: :id

  has_many :boards,
  through: :board_memberships,
  source: :board
end
