class Post < ActiveRecord::Base

  validates :title, :user_id, :sub_id, presence: true
  

  belongs_to :sub

  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User
end
