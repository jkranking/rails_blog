require 'faker'

10.times { User.create(name: Faker::StarWars.character) }

50.times { Post.create(title: Faker::StarWars.quote, body: Faker::Lorem.paragraph(20), user_id: rand(1..10)) }