class Spell < ApplicationRecord
    has_many :character_spells
    has_many :characters, through: :character_spells
    
    has_many :job_spells
    has_many :jobs, through: :job_spells
end
