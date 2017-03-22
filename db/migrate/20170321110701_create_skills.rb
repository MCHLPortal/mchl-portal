class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.integer :skill_id
      t.boolean :presence
      t.text :comment
      t.integer :domain_id

      t.timestamps
    end
  end
end
