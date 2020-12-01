# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "destroying old instances"
Session.destroy_all
Contact.destroy_all
User.destroy_all
puts "creating a user & three contacts"

user = User.new(email: "test@test.com", password: "123123", password_confirmation: "123123")
user.save!

puts "creating sessions"

25.times do
  Session.new(time: Faker::Time.between(from: DateTime.now - 5, to: DateTime.now), user_id: user.id).save!
  puts Session.count
end

puts "done, hf"