class ChangeForeignKeyForStudents < ActiveRecord::Migration[5.0]
  def change
  	rename_column :students, :sections_id, :section_id
  end
end
