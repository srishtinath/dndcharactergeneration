class AddColumnToAbilities < ActiveRecord::Migration[6.0]
  def change
    add_column :abilities, :job_id, :integer
  end
end
