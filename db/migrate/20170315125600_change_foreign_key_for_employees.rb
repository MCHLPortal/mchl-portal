class ChangeForeignKeyForEmployees < ActiveRecord::Migration[5.0]
  def change
  	rename_column :employees, :sections_id, :section_id
  end
end
