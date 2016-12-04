class BoardMembership < ActiveRecord::Base
  belongs_to :member,
    primary_key: :id,
    foreign_key: :member_id,
    class_name: :Executive

  belongs_to :board,
  foreign_key: :board_id,
  primary_key: :id,
  class_name: :Board
end
