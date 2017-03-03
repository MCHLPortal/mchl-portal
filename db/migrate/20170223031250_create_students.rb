class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :lname
      t.string :fname
      t.string :mname
      t.string :sex
      t.date :birthdate
      t.integer :age
      t.string :handedness
      t.string :father_lname
      t.string :father_fname
      t.string :father_mname
      t.string :father_occupation
      t.integer :father_age
      t.string :father_educ_attainment
      t.string :mother_lname
      t.string :mother_fname
      t.string :mother_mname
      t.string :mother_occupation
      t.integer :mother_age
      t.string :mother_educ_attainment

      t.timestamps null: false
    end
  end
end
