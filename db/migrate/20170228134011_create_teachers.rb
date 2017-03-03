class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :fname
      t.string :mname
      t.string :lname

      t.timestamps null: false
    end
  end
end
