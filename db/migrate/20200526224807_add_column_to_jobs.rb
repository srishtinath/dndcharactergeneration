class AddColumnToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :url, :string
    add_column :jobs, :index, :string
  end
end
