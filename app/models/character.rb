class Character < ApplicationRecord
    has_many :character_abilities
    has_many :abilities, through: :character_abilities

    has_many :character_spells
    has_many :spells, through: :character_spells

    belongs_to :job
    belongs_to :user
end
