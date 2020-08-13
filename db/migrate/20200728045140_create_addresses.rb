class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code,       null: false
      t.string      :prefectures,       null: false
      t.string      :city,              null: false
      t.string      :house_number,      null: false
      t.string      :building_name,     
      t.integer     :room_number
      t.string      :phone_number
      t.references  :user           

      t.timestamps
    end
  end
end
