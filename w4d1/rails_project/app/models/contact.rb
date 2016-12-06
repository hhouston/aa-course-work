# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ApplicationRecord
  validates :name, :email, :user_id, presence: true
  validates :email, :uniqueness => {:scope => :user_id}

  belongs_to :owner,
  foreign_key: :user_id,
  class_name: :User

  has_many :contact_shares,
  foreign_key: :contact_id,
  class_name: :ContactShare

  has_many :shared_users,
  through: :contact_shares,
  source: :user

end
