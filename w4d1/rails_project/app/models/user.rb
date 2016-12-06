# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           default(""), not null
#

class User < ApplicationRecord
  validates :username, presence: true

  has_many :contacts,
  foreign_key: :user_id,
  class_name: :Contact

  has_many :contact_shares,
  foreign_key: :user_id,
  class_name: :ContactShare

  has_many :shared_contacts,
  through: :contact_shares,
  source: :contact
end
