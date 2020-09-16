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

| Column             | Type    | Options                        |
| -------------      | ------- | ------------------------------ |
| postcode           | string  | null: false                    |
| prefectures        | string  | null: false                    |
| cities             | string  | null: false                    |
| address            | string  | null: false                    |
| building-name      | string  | null: false                    |
| phone-number       | string  | null: false                    |
| user-id            | integer | null: false, foreign_key: true |

### Association

- has_one :shopping-address
- belongs_to :user

## items テーブル

| Column             | Type    | Options                       |
| ------------------ | ------  | ----------------------------- |
| product-name       | string  | null: false                   |
| category           | string  | null: false                   |
| price              | string  | null: false                   |
| seller             | string  | null: false                   |
| user-id            | integer | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many :items

## images テーブル

| Column             | Type     | Options                       |
| -------------------| ---------| ----------------------------- |
| image              | string   | null: false                   |
| item               | string   | null: false                   |
| item-id            | integer  | null: false, foreign_key: true|

### Association

- belongs_to :item

## shopping-address  テーブル

| Column              | Type       | Options                       |
| ------------------- | ---------- | ------------------------------|
| shopping-address    | string     | null: false                   |
| buyer-id            | integer    | null: false, foreign_key: true|

### Association

- belongs_to :buyer