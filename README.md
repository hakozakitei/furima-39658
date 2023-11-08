# README

# Users Table

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| username           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
|nickname | string | null: false |
|first_name | string | null: false |
|last_name | string | null: false |
|first_name_kana | string | null: false |
|last_name_kana | string | null: false |
|birth_date | date | null: false |




## Associations
- has_many :item
- has_many :purchase

# Items Table

| Column       | Type       | Options                       |
|--------------|------------|-------------------------------|
| name         | string     | null: false                   |
| description  | text       | null: false                   |
| price        | integer    | null: false                   |
| user         | references | null: false, foreign_key: true|
| category_id	   |integer	    | null: false                   |
| condition_id	   |integer	    | null: false                   |
| shipping_fee_burden_id|integer	| null: false               |
| shipping_origin_id	   |integer  |	null: false               |
| shipping_days_id     |integer  | null: false               |


## Associations
- belongs_to :user
- has_one :purchase

# Purchases Table

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |


## Associations
- belongs_to :item
- belongs_to :user
- has_one :shipping_info

# ShippingInfos Table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| purchases_id     | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |
| phone_number  | string     | null: false                    |
|shipping_origin_id  |integer	     |null: false                     |
|city           |string      |　　　　　　                      |
|address         |	string	 |null: false                     |
|building_name   |	string   |                                |


## Associations
- belongs_to :purchase
