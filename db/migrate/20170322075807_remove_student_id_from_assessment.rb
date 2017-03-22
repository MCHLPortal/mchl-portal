class RemoveStudentIdFromAssessment < ActiveRecord::Migration[5.0]
  def change
    remove_column :assessments, :student_id, :integer
  end
end
