# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Admin account
User.create!(username: "admin", admin: true, password: "foobar", 
  password_confirmation: "foobar")

0.times do |n|
  name  = Faker::Name.last_name
  password = "password123"
  User.create!(username:  name, password: password, 
    password_confirmation: password)
end

# Create some fake issues
Issue.create!(title: "President", desc1: "President of the United States", 
  desc2: "Please select one.")
Issue.create!(title: "VP", desc1: "I know this isn't how elections work", 
  desc2: "Please select one again.")
Issue.create!(title: "House", desc1: "House of something", 
  desc2: "Please pick one.")

# Give issues fake options
issues = Issue.order(:created_at).take(3)
3.times do
  option = Faker::Name.last_name
  issues.each { |issue| issue.options.create!(option: option) }
end