# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{username: 'hmhouston7'}, {username: 'new_user'}])

contacts = Contact.create([{name: 'contact1', email: 'email1', user_id: 2}, {name: 'hunter', email: 'hmhouston7@gmail.com', user_id: 1}])

shared_contacts = SharedContact.create([{contact_id: 2, user_id: 1}])
