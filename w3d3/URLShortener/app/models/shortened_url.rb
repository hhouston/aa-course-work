class ShortenedUrl < ActiveRecord::Base
  validates :short_url, uniqueness: true, presence: true
  validates :user_id, :long_url, presence: true

  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_many :visits

  has_many :vistors,
  through: :visits,
  source: :visitor

  # has_many :visited_urls,
  # primary_key: :id,
  # foreign_key: :url_id,
  # class_name: :Visit
  #
  # has_many :total_urls,
  # through: :visited_urls,
  # source: :

  def self.random_code
    random_code = SecureRandom::urlsafe_base64(12)

    until !(ShortenedUrl.exists?(:short_url == random_code))
      random_code = SecureRandom::urlsafe_base64(12)
    end
    random_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    shortened_url = ShortenedUrl.random_code
    ShortenedUrl.create!(short_url: shortened_url, long_url: long_url, user_id: user.id)
  end
end
