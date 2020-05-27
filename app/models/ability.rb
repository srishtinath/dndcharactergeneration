class Ability < ApplicationRecord
    has_many :character_abilities
    has_many :characters, through: :character_abilities
    
    belongs_to :job
end
