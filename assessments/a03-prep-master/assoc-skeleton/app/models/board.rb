class Board < ActiveRecord::Base
  belongs_to :company,
  foreign_key: :company_id,
  primary_key: :id,
  class_name: :Company

  has_many :board_memberships,
  class_name: :BoardMembership,
  foreign_key: :member_id

  has_many :members,
  through: :board_memberships,
  source: :member

  has_one(
    :exchange,
    through: :company,
    source: :exchange
  )

end
