# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'dnd_api'

@api = DndApi.new

@jobs = @api.classes
@abilities = @api.abilities

@jobs.each do |name|
    Job.create(name: name)
end

@abilities.each do |ability|
    Ability.create(name: ability["name"])
end
# create_table "abilities", force: :cascade do |t|
#     t.string "name"
#     t.string "description"

