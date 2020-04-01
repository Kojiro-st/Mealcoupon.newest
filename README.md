## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|unique: true, null: false|
|password|string|null: false|

## Association
has_many :posts

## postテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|couponcode|string|null: false|
|shopname|string|null: false|
|address|string|null: false|
|expirydate|string|null: false|
|user_id|integer||

## Association
belongs_to : user