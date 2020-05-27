class DeleteJobAbility < ActiveRecord::Migration[6.0]
  def change
    drop_table :job_abilities
  end
end
