# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


# Create Admin account
User.create!(username: "admin", admin: true, password: "foobar", 
             password_confirmation: "foobar")


# Create fake accounts
10.times do |n|
  name  = Faker::Name.last_name
  password = "foobar"
  User.create!(username: name, password: password, 
               password_confirmation: password)
end


# Create some issues with options
title = "For Chief Dairy Queen"
desc1 = "Unexpired Term"
desc2 = "Shall Justice Mint C. Chip of the Supreme Court of the State of Ice Cream be retained in office for another term?"
issue = Issue.create!(title: title, desc1: desc1, desc2: desc2)
option = "Yes"
issue.options.create!(option: option)
option = "No"
issue.options.create!(option: option)

title = "For State Rep. District M&M"
desc1 = "Vote For One"
desc2 = ""
issue = Issue.create!(title: title, desc1: desc1, desc2: desc2)
option = "P. Nut Butter (REPUBLICAN)"
issue.options.create!(option: option)
option = "Cream C. Kol (INDEPENDENT)"
issue.options.create!(option: option)
option = "Marsh Mallow (DEMOCRAT)"
issue.options.create!(option: option)

title = "Constitutional Initiative No. 116"
desc1 = "Vote for One"
desc2 = "Make Vanilla (Over Chocolate) the Official Best Flavor"
issue = Issue.create!(title: title, desc1: desc1, desc2: desc2)
option = "YES ON CI - 116 (FOR VANILLA)"
issue.options.create!(option: option)
option = "NO ON CI - 116 (NO ON VANILLA)"
issue.options.create!(option: option)


# Create fake votes
issues = Issue.order(:created_at)
issues.each { |issue|
  options = Option.where(issue_id: issue.id)
  users = User.order(:created_at)
  users.each { |user|
    user_id = user.id
    issue_id = issue.id
    option_id = options[rand(options.length)].id
    Result.create!(user_id: user_id, issue_id: issue_id, option_id: option_id)
  }
}
