class CharacterAbility < ApplicationRecord
    belongs_to :ability
    belongs_to :character

    accepts_nested_attributes_for :ability
    accepts_nested_attributes_for :character
end
