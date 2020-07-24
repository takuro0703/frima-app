class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :item_description, null: false
      t.string :brand_description
      t.string :item_condition, null: false
      t.string :delivery_fee, null: false
      t.string :region, null: false
      t.string :delivery_span, null: false
      t.integer :item_price, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
