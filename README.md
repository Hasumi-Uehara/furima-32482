# README

# テーブル設計

## Users テーブル

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| first_name         | string     | null: false               |
| last_name          | string     | null: false               |
| first_name_reading | string     | null: false               |
| last_name_reading  | string     | null: false               |
| birth_date         | date       | null: false               |

### Usersテーブルのアソシエーション

- has_many :items
- has_many :orders

## Items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| name                     | string     | null: false                    |
| info                     | text       | null: false                    |
| category_id              | integer    | null: false                    |
| sales_status_id          | integer    | null: false                    |
| shopping_fee_status_id   | integer    | null: false                    |
| prefecture_id            | integer    | null: false                    |
| scheduled_delivery_id    | integer    | null: false                    |
| price                    | integer    | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Itemsテーブルのアソシエーション

- belongs_to :user
- has_one :order

## Orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Ordersテーブルのアソシエーション

- belongs_to :user
- belongs_to :item
- has_one :address

## Addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Addressesテーブルのアソシエーション

- belongs_to :order