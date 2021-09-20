# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(name:  "Example User",
    email: "example@railstutorial.org",
    password:              "foobar",
    password_confirmation: "foobar",
    admin: true,
    activated: true,
    activate_at: Time.zone.now)        

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@mail.com"
password = "123456"
User.create(name:  name,
      email: email,
      password:              '123456',
      password_confirmation: '123456',
      activated: true,
      activate_at: Time.zone.now
    )
end