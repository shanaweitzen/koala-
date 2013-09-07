# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(
	first_name: 'Kermit',
	last_name: 'Frog', 
	email: 'kermitthefrog@gmail.com', 
	password_hash: 'kermitthefrog',
	password_salt: 'kermitthefrog'
)


