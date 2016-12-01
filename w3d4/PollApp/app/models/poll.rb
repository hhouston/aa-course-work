class Poll < ApplicationRecord

  validates :author_id, :title, presence: true

  belongs_to :author,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :User

  has_many :questions,
    foreign_key: :poll_id,
    primary_key: :id,
    class_name: :Question

  has_many :responses,
    through: :questions,
    source: :responses
end
