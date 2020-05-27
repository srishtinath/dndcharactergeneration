class CreateJobSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :job_spells do |t|
      t.integer :job_id
      t.integer :spell_id

      t.timestamps
    end
  end
end
