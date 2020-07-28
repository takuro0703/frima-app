class CreateConfirmations < ActiveRecord::Migration[6.0]
  def change
    create_table :confirmations do |t|
      t.string :family_name,         null: false
      t.string :last_name,           null: false
      t.string :frigana_first_name,  null: false
      t.string :frigana_last_name,   null: false
      t.integer :year,               null: false
      t.integer :month,              null: false
      t.integer :day,                null: false
      t.references  :user 
      t.timestamps
    end
  end
end
