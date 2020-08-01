class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.string :item_description, null: false
      t.string :brand_description
      t.integer :status_id, null: false
      t.integer :fee_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :span_id, null: false
      t.integer :item_price, null: false

      t.string  :sold_status, null: false
      t.references :user
      t.references :category

      t.timestamps
    end
  end
end
