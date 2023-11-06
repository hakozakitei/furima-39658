# README

# Users Table

| Column             | Type   | Options     |
|--------------------|--------|-------------|
| id                 | integer| null: false, primary key |
| username           | string | null: false |
| email              | string | null: false, unique: true |
| password | string | null: false |

## Associations
- has_many :items
- has_many :transactions, foreign_key: :buyer_id

# Items Table

| Column       | Type       | Options                       |
|--------------|------------|-------------------------------|
| id           | integer    | null: false, primary key      |
| name         | string     | null: false                   |
| description  | text       | null: false                   |
| price        | decimal    | null: false                   |
| user_id      | integer    | null: false, foreign_key: true|

## Associations
- belongs_to :user
- has_one :transaction

# Transactions Table

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| id         | integer    | null: false, primary key       |
| item_id    | integer    | null: false, foreign_key: true |
| buyer_id   | integer    | null: false, foreign_key: true |
| created_at | datetime   | null: false                    |

## Associations
- belongs_to :item
- belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id
- has_one :shipping_info

# ShippingInfo Table

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| id            | integer    | null: false, primary key       |
| transaction_id| integer    | null: false, foreign_key: true |
| address       | string     | null: false                    |
| zip_code      | string     | null: false                    |
| phone_number  | string     | null: false                    |

## Associations
- belongs_to :transaction
