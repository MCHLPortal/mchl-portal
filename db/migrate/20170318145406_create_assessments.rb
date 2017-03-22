class CreateAssessments < ActiveRecord::Migration[5.0]
  def change
    create_table :assessments do |t|
      t.decimal :tuition
      t.decimal :other_fees
      t.decimal :other_assessment
      t.decimal :total_assessment
      t.integer :student_id
	  t.string  :level

      t.timestamps
    end
  end
end
