class CreateDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :domains do |t|
      t.string :name
      t.integer :raw_score
      t.integer :scaled_score
      t.integer :evaluation_id

      t.timestamps
    end
  end
end
