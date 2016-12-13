class PostSub < ActiveRecord::Base
  validates :sub_id, uniqueness: { scope: :post_id }

end
