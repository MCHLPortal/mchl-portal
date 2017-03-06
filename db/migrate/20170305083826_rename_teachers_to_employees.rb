class RenameTeachersToEmployees < ActiveRecord::Migration
  def change
    rename_table :teachers, :employees
  end
end
