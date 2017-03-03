class AddForeignKeyToSections < ActiveRecord::Migration
  def change
    add_reference :sections, :teachers, index: true, foreign_key: true
  end
end
