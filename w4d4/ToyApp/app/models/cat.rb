class Cat < ActiveRecord::Base

  # has_many :toys, as: :toyable
  include Toyable
end
