class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.date :date
      t.decimal :amount
      t.string :method
      t.decimal :balance
      t.integer :student_id

      t.timestamps
    end
  end
end
