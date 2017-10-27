# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create(title: 'Star Wars', summary: 'In a distant galaxy, the empire.')
Movie.create(title: 'Matrix', summary: 'The one, and a super computer whatever.')
Movie.create(title: 'Pacific Rim', summary: 'Robots vs monsters FTW.')

User.create(email: 'alex@local', password: 'hola')
