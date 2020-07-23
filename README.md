# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



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
|delivery_fee|integer|null: false|
|region|string|null: false|
|delivery_span|integer|null: false|
|item_price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :images




## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|
