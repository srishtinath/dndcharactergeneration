class Ability < ApplicationRecord
    has_many :character_abilities
    has_many :characters, through: :character_abilities
    
    has_many :job_abilities
    has_many :jobs, through: :job_abilities
end
