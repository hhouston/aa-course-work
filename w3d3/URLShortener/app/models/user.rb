class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true

  has_many :submitted_urls,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :ShortenedUrl
end
