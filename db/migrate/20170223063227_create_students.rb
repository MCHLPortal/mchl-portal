class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username
      t.string :password_digest
      t.string :fname
      t.string :mname
      t.string :lname
      t.string :sex, limit: 1
      t.string :address
      t.date :birthdate
      t.string :handedness
      t.string :father_fname
      t.string :father_mname
      t.string :father_lname
      t.string :father_occupation
      t.integer :father_age
      t.string :father_educ_attainment
      t.string :mother_fname
      t.string :mother_mname
      t.string :mother_lname
      t.string :mother_occupation
      t.integer :mother_age
      t.string :mother_educ_attainment
      t.string :id_number

      t.timestamps null: false
    end
  end
end
