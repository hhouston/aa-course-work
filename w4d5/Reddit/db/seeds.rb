# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create([
  { email: 'scotty', password: 'password'},
  { email: 'bill', password: 'password'},
  { email: 'sally', password: 'password'}
  ])
  
subs = Sub.create([
  {title: 'basketball', description:'is tite', user_id: 1 },
  { title: 'ice cream', description: 'you already know', user_id: 2},
  { title: 'TAs', description: 'are suppper chill', user_id: 3}
  ])


posts = Post.create([
  { title: 'i like basketball!', url: 'bball.com', content: 'this is a sentenct about conent and basketball', sub_id: 1, user_id: 3 },
  { title: 'ice cream is coll', url: 'iscream.com', content: 'this is a sentenct about conent and ice cream', sub_id: 2, user_id: 3 },
  { title: 'i like basketball too!', url: 'bball.com', content: 'this is a sentenct about conent and baskeballbaskeball', sub_id: 1, user_id: 3 },
  { title: 'TAs', url: 'TATATATA', content: 'this is a sentenct about conent and tas', sub_id: 3, user_id: 1 },
  { title: 'I like TAs!', url: 'reddit', content: 'this is a sentenct about conent and sally', sub_id: 3, user_id: 3 }
  ])
