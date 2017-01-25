require 'faker'
	
3.times { User.create( name: Faker::Name.name, email: Faker::Internet.email, password: 'password') }

10.times { Post.create(title: Faker::Hacker.say_something_smart, body: Faker::Lorem.paragraph(20), user_id: rand(1..3)) }