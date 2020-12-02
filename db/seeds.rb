# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

def month_with_zero(month)
  month.to_s.length == 1 ? "0#{month}".to_i : month
end

def day_with_zero(day)
  day.to_s.length == 1 ? "0#{day}".to_i : day
end

puts "destroying old instances"
Session.destroy_all
Contact.destroy_all
User.destroy_all
puts "creating a user & three contacts"

user = User.new(email: "test@test.com", password: "123123", password_confirmation: "123123")
user.save!

puts "creating sessions"

20.times do
  a = Session.new(user_id: user.id)
  a.save!
  puts "----------------new session"
  a.created_at = Faker::Time.between(from: DateTime.new(2020,11,28,4,5,6,'+01:00'), to: DateTime.new(2020,12,4,4,5,6,'+01:00'))
  a.save
  puts a.created_at
end

puts "done, hf"