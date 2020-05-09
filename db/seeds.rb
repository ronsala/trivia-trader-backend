# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Category.destroy_all
Game.destroy_all
User.destroy_all

['Arts & Entertainment', 'Games & Sports', 'History', 'Science & Tech', 'Hodge Podge'].each do |c|
  Category.create(name: c)
end

20.times do
  User.create(
    username: Faker::Name.unique.name,
    email: Faker::Internet.email
  )
end

Game.create(title: 'Controversy on Canvas', category_id: Category.find_by(name: 'Arts & Entertainment').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))

Game.create(title: 'Musical Conspiracy Theories', category_id: Category.find_by(name: 'Arts & Entertainment').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))

Game.create(title: 'Ruler Rules', category_id: Category.find_by(name: 'Games & Sports').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))

Game.create(title: 'The Great War', category_id: Category.find_by(name: 'History').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))

Game.create(title: 'The Solar System', category_id: Category.find_by(name: 'Science & Tech').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))

Game.create(title: 'Starts With L', category_id: Category.find_by(name: 'Hodge Podge').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))
