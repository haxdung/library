# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create name: "admin", email: "admin@gmail.com", password: "12345678", password_confirmation: "12345678",
            role: 2
User.create name: "Chien", email: "chien@gmail.com", password: "12345678", password_confirmation: "12345678",
                    role: 0
User.create name: "Chien1", email: "chien1@gmail.com", password: "12345678", password_confirmation: "12345678",
            role: 0
User.create name: "Chien2", email: "chien2@gmail.com", password: "12345678", password_confirmation: "12345678",
            role: 0
User.create name: Faker::Book.author, email: "autthor@gmail.com", password: "12345678", password_confirmation: "12345678",
            role: 1
User.create name: Faker::Book.author, email: "autthor1@gmail.com", password: "12345678", password_confirmation: "12345678",
            role: 1
User.create name: Faker::Book.author, email: "autthor2@gmail.com", password: "12345678", password_confirmation: "12345678",
            role: 1
Category.create name: "History"
Category.create name: "Geography"
Category.create name: "Math"
Category.create name: "Romantic"
Category.create name: "Fiction"
rand = Random.new

books = []
50.times do |n|
  Book.create(name: Faker::Book.title, description: Faker::Lorem.paragraph(2, false, 4),
  category_id: rand(1..4), author_id: rand(5..7),
                    image: File.open(File.join(Rails.root,"app/assets/images/book/#{rand(1..17)}.jpeg")) )
end
