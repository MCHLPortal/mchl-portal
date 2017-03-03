class AddForeignKeyToTeachers < ActiveRecord::Migration
  def change
    add_reference :teachers, :sections, index: true, foreign_key: true
  end
end
