class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.date :date
      t.integer :age
      t.integer :sum_scaled_scores
      t.integer :standard_score
      t.text :interpretation
      t.integer :student_id

      t.timestamps
    end
  end
end
