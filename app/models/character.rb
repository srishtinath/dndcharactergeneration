class Character < ApplicationRecord
    has_many :character_abilities
    has_many :abilities, through: :character_abilities
    
    accepts_nested_attributes_for :abilities
    accepts_nested_attributes_for :character_abilities

    has_many :character_spells
    has_many :spells, through: :character_spells

    belongs_to :job
    belongs_to :user

    def define_proficiency_bonus
        case self.level
        when 1..4
            self.update(proficiency_bonus: "+2")
        when 5..8
            self.update(proficiency_bonus: "+3")
        when 9..12
            self.update(proficiency_bonus: "+4")
        when 13..16
            self.update(proficiency_bonus: "+5")
        when 17..20
            self.update(proficiency_bonus: "+6")
        else
            self.update(proficiency_bonus: "+0")
        end
    end
end
