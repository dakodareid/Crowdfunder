# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
		first_name: "Test", 
		last_name: "User", 
		email: "user@example.com", 
		password: "asdf", 
		password_confirmation: "asdf"
	)

5.times do
	name = Faker::Name.name.split
	User.create!(
		first_name: name.first, 
		last_name: name.last, 
		email: Faker::Internet.email, 
		password: "asdf", 
		password_confirmation: "asdf"
	)
end

10.times do
	p = Project.create!(
		title: Faker::Commerce.product_name,
		description: Faker::Hacker.say_something_smart,
		goal: 4000,
		start_date: DateTime.new,
		end_date: DateTime.new + 30.days,
		owner_id: User.all.sample.id
	)
	5.times do |e|
		Reward.create!(
			amount: (e + 1) * 15,
			description: Faker::Hacker.say_something_smart,
			project_id: p.id
		)
	end

end
