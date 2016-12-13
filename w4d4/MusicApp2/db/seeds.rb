# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  { email: 'hhouston@smu.edu', password: 'password123' },
  { email: 'sam@corporatedough.rap', password: 'password123' }
  ])

bands = Band.create([
  { name: 'The Eagles' },
  { name: 'EMINEM' },
  { name: 'Kygo' }
  ])

albums = Album.create([
  { name: 'Hotel California', band_id: 1, yr: 1976 },
  { name: 'The Eminem Show', band_id: 2, yr: 2002 },
  { name: 'The Marshal Mathers LP', band_id: 2, yr: 2000 },
  { name: 'Cloud Nine', band_id: 3, yr: 2016 }
  ])

tracks = Track.create([
  { name: 'Hotel California', album_id: 1 },
  { name: 'Superman', album_id: 2 },
  { name: 'Drug Ballad', album_id: 3 },
  { name: 'Stan', album_id: 3 },
  { name: 'Stole the Show', album_id: 4 },
  { name: 'Fragile', album_id: 4 }
  ])
