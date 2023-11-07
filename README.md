# README

# Users Table

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| id                 | integer| null: false, primary key |
| username           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

## Associations
- has_many :items
- has_many :transactions

# Items Table

| Column       | Type       | Options                       |
|--------------|------------|-------------------------------|
| id           | integer    | null: false, primary key      |
| name         | string     | null: false                   |
| description  | text       | null: false                   |
| price        | integer    | null: false                   |
| user         | references | null: false, foreign_key: true|
| category	   |string	    | null: false                   |
| condition	   |string	    | null: false                   |
| shipping_fee_burden|	string	| null: false               |
| shipping_origin	   |string    |	null: false               |
| shipping_days	     |string	  | null: false               |


## Associations
- belongs_to :user
- has_one :transaction

# Transactions Table

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| id         | integer    | null: false, primary key       |
| item       | references | null: false, foreign_key: true |
| buyer      | references | null: false, foreign_key: true |
| created_at | datetime   | null: false                    |

## Associations
- belongs_to :item
- belongs_to :user
- has_one :shipping_info

# ShippingInfo Table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| id            | integer    | null: false, primary key       |
| transaction   | references | null: false, foreign_key: true |
| address       | string     | null: false                    |
| zip_code      | string     | null: false                    |
| phone_number  | string     | null: false                    |
|recipient_name	|string	     |null: false                     |
|shipping_origin|	string	   |null: false                     |
|shipping_duration|	integer	 |null: false                     |

## Associations
- belongs_to :transaction
