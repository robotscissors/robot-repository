require 'random_data'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@testUser=User.new(
  fullname: "Christopher Bazin",
  email:  "cjbazin@gmail.com",
  #encrypted_password:   Faker::Internet.password(8)
  password: "123456",
  password_confirmation: "123456",
  role: :admin
)
@testUser.skip_confirmation!
@testUser.save!

# 10.times do
#   @pass = Faker::Internet.password(8)
#   @role = RandomData.random_role
#   user = User.new(
#     fullname: Faker::Name.name,
#     email:  Faker::Internet.email,
#     #encrypted_password:   Faker::Internet.password(8)
#     password: @pass,
#     password_confirmation: @pass,
#     role: @role
#   )
#   user.skip_confirmation!
#   user.save!
# end
# users = User.all
#
# 10.times do
#   @title = Faker::Lorem.sentence(3, false, 4)
#   @description = Faker::Lorem.sentence(10, false, 12)
#   @keywords = Faker::Lorem.sentence(3, false, 8)
#   @document = Document.new(title: @title, description: @description, keywords: @keywords, user: users.sample)
#   @document.save!
# end

puts "Seed finished"
puts "#{User.count} Users created"
# puts "#{Document.count} Documents created"
