class RemoveTeachersIdFromSections < ActiveRecord::Migration
  def change
    remove_column :sections, :teachers_id, :integer
  end
end
