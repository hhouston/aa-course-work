class Visit < ActiveRecord::Base
  validates :url_id, :user_id, presence: true

  belongs_to :vistor,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :visted_url,
  primary_key: :id,
  foreign_key: :url_id,
  class_name: :ShortenedUrl


end
