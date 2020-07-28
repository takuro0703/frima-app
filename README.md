

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|mail_address|string|null: false, unique:true|
|password|string|null: false|

### Association
- has_one :credit_card
- has_one :address
- has_one :confirmation
- has_many :items




## credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|credit_number|integer|null: false|
|year|integer|null: false|
|month|integer|null: false|
|cvc_number|integer|null: false|
|name|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user




## confirmationsテーブル

|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|name|string|null: false|
|frigana_first-name|string|null: false|
|frigana_name|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user




## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|null: false|
|room_number|int|
|phone_number|string|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user




## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_name|string|null: false|
|item_description|string|null: false|
|brand_description|string|
|item_condition|string|null: false|
|delivery_fee|string|null: false|
|region|string|null: false|
|delivery_span|string|null: false|
|item_price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :images
- has_many :categories




## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|foreign_key: true|

### Association
- belongs_to :item





## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|ancestry|string|null: false|
|name|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

a