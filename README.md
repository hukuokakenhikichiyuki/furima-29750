# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password-confirmation | string | null: false |
| family-name           | string | null: false |
| first-name            | string | null: false |
| family-name-kana      | string | null: false |
| first-name-kana       | string | null: false |
| birthday              | date   | null: false |

### Association

- has_many :items
- has_many :purchase

## orders テーブル

| Column              | Type     | Options                        |
| --------------------| -------  | ------------------------------ |
| postcode            | string   | null: false                    |
| prefectures         | integer  | null: false                    |
| cities              | string   | null: false                    |
| address             | string   | null: false                    |
| building-name       | string   |                                |
| phone-number        | string   | null: false                    |
| purchase_id         | integer  | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## items テーブル

| Column                  | Type     | Options                       |
| ------------------------| ------   | ----------------------------- |
| name                    | string   | null: false                   |
| category                | integer  | null: false                   |
| price                   | integer  | null: false                   |
| description             | text     | null: false                   |
| product-condition       | integer  | null: false                   |
| shipping-fee-burden     | integer  | null: false                   |
| shipping-area           | integer  | null: false                   |
| estimated-shipping-date | integer  | null: false                   |
| user_id                 | integer  | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase-detail

## purchase_details テーブル

| Column              | Type     | Options                       |
| ------------------- | -------- | ------------------------------|
| item_id             | integer  | null: false, foreign_key: true|
| user_id             | integer  | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :orders
- belongs_to :item