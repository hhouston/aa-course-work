# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  # User.destroy_all
  user1 = User.create(:email => 'zidian.aa.io')
  user2 = User.create(:email => 'hunter.aa.io')





  # ShortenedUrl.destroy_all
  url1 = ShortenedUrl.create(:short_url => '5', :long_url => 'facebook.com', :user_id => user1.id)
  url2 = ShortenedUrl.create(:short_url => 'tw', :long_url => 'twitter.com', :user_id => user2.id)
  url3 = ShortenedUrl.create(:short_url => 'rd', :long_url => 'reddit.com', :user_id => user2.id)


end
