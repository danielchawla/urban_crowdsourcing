# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


suggestions = Suggestion.create([{ user_id: 1, overview: "park bench", description: "it would be sweet to have a park bench located here", location: "green park" }])
suggestions = Suggestion.create([{ user_id: 2, overview: "park table", description: "it would be sweet to have a park table located here", location: "orange park" }])
suggestions = Suggestion.create([{ user_id: 3, overview: "park flower", description: "it would be sweet to have a park flower located here", location: "pink park" }])
suggestions = Suggestion.create([{ user_id: 4, overview: "park bathroom", description: "it would be sweet to have a park bathroom located here", location: "brown park" }])


users = User.create([{ first_name: "Fred", last_name: "Gray", age: 13, occupation: "student", gender: "male"}])
users = User.create([{ first_name: "Bob", last_name: "Dylan", age: 15, occupation: "rapper", gender: "male"}])
users = User.create([{ first_name: "Alexis", last_name: "Smith", age: 17, occupation: "orthodontist", gender: "female"}])
users = User.create([{ first_name: "Choo", last_name: "Too", age: 22, occupation: "cook", gender: "male"}])




  # create_table "suggestions", force: :cascade do |t|
  #   t.integer "user_id"
  #   t.string  "overview"
  #   t.string  "description"
  #   t.string  "location"
  # end

  # create_table "users", force: :cascade do |t|
  #   t.string   "first_name"
  #   t.string   "last_name"
  #   t.integer  "age"
  #   t.string   "occupation"
  #   t.string   "gender"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end