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

## userテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|mail-address|string|null: false, unique:true|
|password|string|null: false|

### Association
- belongs_to :credit-card
- belongs_to :user_address
- belongs_to :user_confirmation
- has_many :item




## credit-cardテーブル

|Column|Type|Options|
|------|----|-------|
|credit-number|integer|null: false|
|year|integer|null: false|
|month|integer|null: false|
|cvc-number|integer|null: false|
|name|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user




## user-confirmationテーブル

|Column|Type|Options|
|------|----|-------|
|family-name|string|null: false|
|name|string|null: false|
|frigana-first-name|string|null: false|
|frigana-name|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user




## user-addressテーブル

|Column|Type|Options|
|------|----|-------|
|postal-code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house-number|string|null: false|
|building-name|string|null: false|
|room-number|int|
|phone-number|string|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user




## itemテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item-name|string|null: false|
|item-description|string|null: false|
|brand-description|string|
|delivery-fee|integer|null: false|
|religion|string|null: false|
|delivery-span|integer|null: false|
|item-price|integer|null: false|

### Association
- belongs_to :user