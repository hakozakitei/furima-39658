# README

# Users Table

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| username           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

## Associations
- has_many :items
- has_many :transactions

# Items Table

| Column       | Type       | Options                       |
|--------------|------------|-------------------------------|
| name         | string     | null: false                   |
| description  | text       | null: false                   |
| price        | integer    | null: false                   |
| user         | references | null: false, foreign_key: true|
| category	   |references	    | null: false                   |
| condition	   |references	    | null: false                   |
| shipping_fee_burden|references	| null: false               |
| shipping_origin	   |references  |	null: false               |
| shipping_days	     |references  | null: false               |


## Associations
- belongs_to :user
- has_one :transaction

# Purchases Table

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| item       | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
| created_at | datetime   | null: false                    |

## Associations
- belongs_to :item
- belongs_to :user
- has_one :shipping_info

# ShippingInfos Table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| purchases     | references | null: false, foreign_key: true |
| address       | string     | null: false                    |
| zip_code      | string     | null: false                    |
| phone_number  | string     | null: false                    |
|recipient_name	|string	     |null: false                     |
|shipping_origin|references  |　　　　　　                      |
|shipping_duration|	integer	 |null: false                     |

## Associations
- belongs_to :transaction
