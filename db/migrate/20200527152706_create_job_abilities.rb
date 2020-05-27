class CreateJobAbilities < ActiveRecord::Migration[6.0]
  def change
    create_table :job_abilities do |t|
      t.integer :job_id
      t.integer :ability_id

      t.timestamps
    end
  end
end
