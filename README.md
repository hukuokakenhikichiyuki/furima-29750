# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| family-name           | string | null: false |
| first-name            | string | null: false |
| family-name-kana      | string | null: false |
| first-name-kana       | string | null: false |
| birthday              | date   | null: false |

### Association

- has_many :items
- has_one :buyer

## buyers テーブル

| Column             | Type     | Options                        |
| -------------      | -------  | ------------------------------ |
| postcode           | string   | null: false                    |
| prefectures        | integer  | null: false                    |
| cities             | string   | null: false                    |
| address            | string   | null: false                    |
| building-name      | string   | null: false                    |
| phone-number       | string   |                                |
| user_id            | integer  | null: false, foreign_key: true |

### Association

- has_one :purchase-detail
- belongs_to :user

## items テーブル

| Column                  | Type    | Options                       |
| ------------------------| ------  | ----------------------------- |
| name                    | string  | null: false                   |
| category                | string  | null: false                   |
| price                   | string  | null: false                   |
| seller                  | string  | null: false                   |
| product-condition       | integer | null: false                   |
| shipping-fee-burden     | integer | null: false                   |
| shipping-area           | integer | null: false                   |
| estimated-shipping-date | integer | null: false                   |
| user_id                 | integer | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase-detail

## purchase-details テーブル

| Column              | Type     | Options                       |
| ------------------- | -------- | ------------------------------|
| user_id             | integer  | null: false, foreign_key: true|
| buyer_id            | integer  | null: false, foreign_key: true|



### Association

- belongs_to :buyer
- belongs_to :item