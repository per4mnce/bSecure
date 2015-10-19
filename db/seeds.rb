# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
 
 # To use this file:
 # rake db:reset
 
50.times do
  User.create!(
    #name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Internet.password(8, 15)
  )
end
users = User.all

#Create secrets
100.times do
  Secret.create!(
    user:        users.sample,
    username:    Faker::Name.name,
    catname:     ["Password", "CreditCard", "SerialNumber", "WebLogin", "Other"].sample,
    description: Faker::Lorem.word + " " + Faker::Lorem.word,
    pw:          Faker::Internet.password(10, 20),
    url:         Faker::Internet.url,
    notes:       Faker::Lorem.paragraph
  )
end
secrets = Secret.all  

#Generate data for Henry
User.first.update_attributes!(
  #name:     'Henry Schaumburger',
  email:    'per4mnce@gmail.com',
  password: 'password'
)

#Generate secrets for henry
25.times do
  Secret.create!(
    user:        User.first,
    username:    Faker::Name.name,
    catname:     ["Password", "CreditCard", "SerialNumber", "WebLogin", "Other"].sample,
    description: Faker::Lorem.word + " " + Faker::Lorem.word,
    pw:          Faker::Internet.password(10, 20),
    url:         Faker::Internet.url,
    notes:       Faker::Lorem.paragraph
  )
end

puts "Seed finished"
puts "#{User.count} Users created!"
puts "#{Secret.count} Secrets created!"
