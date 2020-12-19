# README

# テーブル設計

## Users テーブル

| Column       | Type       | Options                   |
| ------------ | ---------- | ------------------------- |
| email        | string     | null: false, unique: true |
| password     | string     | null: false               |
| nickname     | string     | null: false               |
| name         | string     | null: false               |
| name_reading | string     | null: false               |
| birth_date   | integer    | null: false               |

### Usersテーブルのアソシエーション

- has_many :items
- has_many :orders

## Items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item_name                | string     | null: false                    |
| item_info                | text       | null: false                    |
| item_category            | integer    | null: false                    |
| item_sales_status        | integer    | null: false                    |
| item_shopping_fee_status | integer    | null: false                    |
| item_prefecture          | integer    | null: false                    |
| item_scheduled_delivery  | integer    | null: false                    |
| item_price               | integer    | null: false                    |
| user                     | references | null: false, foreign_key: ture |

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

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefecture   | integer | null: false |
| city         | string  | null: false |
| addresses    | string  | null: false |
| building     | string  | null: false |
| phone_number | integer | null: false |

### Addressedテーブルのアソシエーション

- belongs_to :order