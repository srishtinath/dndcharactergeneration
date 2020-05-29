class Ability < ApplicationRecord
    has_many :character_abilities
    has_many :characters, through: :character_abilities

    accepts_nested_attributes_for :character_abilities
    accepts_nested_attributes_for :characters

    belongs_to :job
end
