class AddAssessmentIdToStudent < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :assessment_id, :integer
  end
end
