class RemoveColumnsFromCharacters < ActiveRecord::Migration[6.0]
  def change
    remove_column :characters, :character_abilities_id
    remove_column :characters, :character_spells_id
  end
end
