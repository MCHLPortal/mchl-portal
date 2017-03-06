class AddColumnsToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :employee_id, :string
    add_column :teachers, :password_digest, :string
    add_column :teachers, :admin, :boolean
  end
end
