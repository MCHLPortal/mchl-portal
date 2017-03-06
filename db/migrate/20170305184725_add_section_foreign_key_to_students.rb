class AddSectionForeignKeyToStudents < ActiveRecord::Migration
  def change
  	add_reference :students, :sections, index: true, foreign_key: true
  end
end
