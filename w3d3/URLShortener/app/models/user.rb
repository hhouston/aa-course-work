class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true

  has_many :submitted_urls,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :ShortenedUrl

  has_many :visitors,
  class_name: :Visit,
  foreign_key: :user_id

  has_many :visted_urls,
  through: :visits,
  source: :visted_url

end
