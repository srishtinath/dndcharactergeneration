# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "dnd_api"
require 'faker'
#======API CALL===============================

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

# =============================================
puts "...Destroying all Users"
User.destroy_all
puts "...Destroying all Characters"
Character.destroy_all
puts "...Destroying all Character Abilities"
CharacterAbility.destroy_all
puts "...Destroying all Character Spells"
CharacterSpell.destroy_all

puts "creating Users"
User.create(name: "Matthew Mercer")
User.create(name: "Marisha Ray")
User.create(name: "Sam Riegel")
User.create(name: "Travis Willingham")
User.create(name: "Laura Bailey")

puts "creating Characters"
15.times do
    Character.create(
        user_id: User.all.sample.id, 
        job_id: Job.all.sample.id, 
        name: Faker::Name.name,
        level: rand(1..20),
        strength: rand(1..20),
        dexterity: rand(1..20),
        constitution: rand(1..20),
        intelligence: rand(1..20),
        wisdom: rand(1..20),
        charisma: rand(1..20),
        hp: rand(1..20),
        proficiency_bonus: rand(1..5),
        passive_wisdom: rand(1..20)
    )
end

puts "creating Character Abilities"
20.times do
    CharacterAbility.create(character_id: Character.all.sample.id, ability_id: Ability.all.sample.id)
end
puts "creating Character Spells"
20.times do
    CharacterSpell.create(character_id: Character.all.sample.id, spell_id: Spell.all.sample.id)
end
