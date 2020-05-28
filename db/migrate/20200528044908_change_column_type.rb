class ChangeColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :characters, :proficiency_bonus, :string
  end
end
