# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.all.each do |user|
#   puts "destroying photos"
#   user.profile.photos.purge
# end
# puts "destroying users"
# Profile.destroy_all
# User.destroy_all

# SEX = ['male', 'female', 'nonbinary', 'other']
# ORIENTATION = ['gay', 'straight', 'bi', 'other']
# user = User.create(email: 'nic@gmail.com', password: 'secret')
# nic = Profile.create(
#   user: user,
#   name: 'Nic',
#   address: Faker::Address.full_address,
#   birthday: Faker::Date.birthday(min_age: 18, max_age: 50),
#   sex: 'male',
#   orientation: 'straight',
#   bio: Faker::Hipster.paragraph
# )
# puts "creating Nic"
# file = URI.open('https://scontent.ftxl3-2.fna.fbcdn.net/v/t1.18169-9/19905365_10155373189971877_3793393228528390940_n.jpg?_nc_cat=106&ccb=1-6&_nc_sid=09cbfe&_nc_ohc=-WUAGqI7ClEAX8cAXQO&_nc_ht=scontent.ftxl3-2.fna&oh=00_AT_ddvI2MNjvLYWf13D11zS0jmjwX-kVI9KZKrTX10dnhg&oe=62A0ADAB')
# nic.photos.attach(io: file, filename: 'nic.png', content_type: 'image/png')

# user = User.create(email: 'kirsten@gmail.com', password: 'secret')
# kirsten = Profile.create(
#   user: user,
#   name: 'Kirsten',
#   address: Faker::Address.full_address,
#   birthday: Faker::Date.birthday(min_age: 18, max_age: 50),
#   sex: SEX.sample,
#   orientation: ORIENTATION.sample,
#   bio: Faker::Hipster.paragraph
# )
# puts "creating Kirsten"
# file = URI.open('https://scontent.ftxl3-1.fna.fbcdn.net/v/t1.6435-9/138071889_10164521156005414_6822027622162442996_n.jpg?_nc_cat=108&ccb=1-6&_nc_sid=09cbfe&_nc_ohc=LPVgLUJmn4MAX-scmbF&_nc_ht=scontent.ftxl3-1.fna&oh=00_AT-mYV080qL4uKDJK788p1XAQwxg-o5g5W2zaIvnUqV9tg&oe=629DECA8')
# kirsten.photos.attach(io: file, filename: 'kirsten.png', content_type: 'image/png')

# user = User.create(email: 'samir@gmail.com', password: 'secret')
# samir = Profile.create(
#   user: user,
#   name: 'Samir',
#   address: Faker::Address.full_address,
#   birthday: Faker::Date.birthday(min_age: 18, max_age: 50),
#   sex: 'male',
#   orientation: 'gay',
#   bio: Faker::Hipster.paragraph
# )
# puts "creating Samir"
# file = URI.open('https://scontent.ftxl3-1.fna.fbcdn.net/v/t1.6435-9/70935821_2924177004263784_2100553433709805568_n.jpg?_nc_cat=111&ccb=1-6&_nc_sid=09cbfe&_nc_ohc=WkvuhGx7MJoAX9U63nu&_nc_ht=scontent.ftxl3-1.fna&oh=00_AT8cMxlEwiR2YBiS4QV9pZkYs7Ej4mhoMZ7iEP11Y_kDWA&oe=629E0B49')
# samir.photos.attach(io: file, filename: 'samir.png', content_type: 'image/png')

# 20.times do
#   user = User.create(email: Faker::Internet.email, password: 'secret')
#   sex = SEX.sample
#   orientation = ORIENTATION.sample
#   name = Faker::Name.first_name
#   profile = Profile.create(
#     user: user,
#     name: name,
#     address: Faker::Address.full_address,
#     birthday: Faker::Date.birthday(min_age: 18, max_age: 50),
#     sex: sex,
#     orientation: orientation,
#     bio: Faker::Hipster.paragraph
#   )
#   file = URI.open("https://source.unsplash.com/random/300x300/?#{orientation},#{sex}")
#   profile.photos.attach(io: file, filename: "#{name}.png", content_type: 'image/png')
#   puts "creating #{profile.name}"
# end

# # Friend creation
profiles = Profile.all
# profiles.each do |profile|
#   friends = Profile.where.not(id: profile).shuffle.take(5)
#   friends.each do |friend|
#     profile.friends << friend
#     friend.profile.friends << profile
#   end
# end

# Post creation
100.times do
  post = Post.create(profile: profiles.sample, content: Faker::Hacker.say_something_smart)
  rand(0..3).times do
    Comment.create(profile: profiles.sample, post: post, content: Faker::Hacker.say_something_smart)
  end
end
