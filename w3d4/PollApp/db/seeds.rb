# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([{ user_name: 'sean' }, { user_name: 'hunter' }])

Poll.create(author_id: 1, title: "SQL Queries")

questions = Question.create([{ text: "How do you use SELECT?", poll_id: 1 },
  { text: "How 2 SQL?", poll_id: 1 },
  { text: "Why isn't this working?", poll_id: 1 }])

answer_choices = AnswerChoice.create([{ question_id: 1, text: "I don't know" },
  { question_id: 1, text: "Like this." }, { question_id: 2, text: "Google it" }, { question_id: 3, text: "Restart your computer" },
      { question_id: 3, text: "Just kill yourself dude" },
      { question_id: 3, text: "ur a nub" }])
