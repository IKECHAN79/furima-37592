# README

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |
| kana               | string | null: false               |
| birthday           | string | null: false               |


### Association
has_many : items, buys




## itemsテーブル

| Column          |Type        |Options                         |
|-----------------|------------|--------------------------------|
| item_name       | string     | null: false                    |
| item_image      | string     | null: false                    |
| item_more       | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_charge | integer    | null: false                    |
| shipping_area   | string     | null: false                    |
| days_to_ship    | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
belongs_to :users, items




## buysテーブル

| Column |Type        | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |


### Association
belongs_to :users, items
has_one    :addresses



## addresses

| Column        | Type   | Options     |
|---------------|--------|-------------|
| post_code     | string | null: false |
| prefectures   | string | null: false |
| city          | string | null: false |
| address       | string | null: false |
| building_name | string | null: true  |
| phone_number  | string | null: false |


### Association
belongs_to :buys