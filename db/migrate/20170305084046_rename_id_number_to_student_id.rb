class RenameIdNumberToStudentId < ActiveRecord::Migration
  def change
  	rename_column :students, :id_number, :student_id
  end
end
