# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "dnd_api"

puts "...Destroying all Jobs"
Job.destroy_all
puts "...Destroying all Spells"
Spell.destroy_all
puts "...Destroying all Abilities"
Ability.destroy_all

api = DndApi.new

puts "...Loading Classes"
api.classes
puts "...Loading Spells"
api.spells
puts "...Loading Abilities"
api.abilities