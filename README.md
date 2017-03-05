# README

This is a voting application by Mike Hallai using the Ruby on Rails framework.
[View this app live on Heroku](https://quiet-sands-92329.herokuapp.com/)

Rails version:
> Rails 5.0.1

Ruby version:
> ruby 2.2.2p95

How to run the test suite: 
> rails test

How to seed the database: 
> rails db:seed
The seed file creates an admin account (username: "admin", password: "foobar")

Heroku Deployment method:
> git push heroku
> heroku pg:reset DATABASE
> heroku run rails db:migrate
> heroku run rails db:seed
> heroku restart