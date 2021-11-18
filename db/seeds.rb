# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = FactoryBot.create(:user, email: "test@gmail.com")

5.times do |i|
	category = FactoryBot.create(:category, user: user)

	5.times do |j|
		deal = FactoryBot.create(:deal, author: user)
		deal.categories.push(category)
	end
end