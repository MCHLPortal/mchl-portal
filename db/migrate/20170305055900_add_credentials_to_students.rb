class AddCredentialsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :username, :string
    add_column :students, :password, :password_digest
  end
end
