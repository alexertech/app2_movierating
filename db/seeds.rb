# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Movie.create(name: 'Star Wars', summary: 'In a distant galaxy, the empire, pew pew.')
Movie.create(name: 'Matrix', summary: 'The one, and a super computer whatever.')
Movie.create(name: 'Pacific Rim', summary: 'Robots vs monsters FTW.')

User.create(email: 'alex@local', passwd: 'hola')
