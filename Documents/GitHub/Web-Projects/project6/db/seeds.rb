# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(name: "John", email: "john.1@osu.edu", role: "instructor", password:"123456")
User.create(name: "Jane", email: "jane.1@osu.edu", role: "student", password:"123456")