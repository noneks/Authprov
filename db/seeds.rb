# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(
	provider: "vkontakte",
	uid: "6736402",
	name: "Кирилл Иванов",
	email: "6736402@vk.com",
	image: "http://cs616426.vk.me/v616426402/178d/pBfFq27EoOk.jpg",
	password: Devise.friendly_token[0,20],
	roles: [:admin]
)