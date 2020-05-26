class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.integer :user_id
      t.integer :job_id
      t.string :name
      t.integer :level
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :intelligence
      t.integer :wisdom
      t.integer :charisma
      t.integer :hp
      t.integer :proficiency_bonus
      t.integer :passive_wisdom

      t.integer :character_abilities_id
      t.integer :character_spells_id
      t.timestamps
    end
  end
end
