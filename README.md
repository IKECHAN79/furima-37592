# README

## usersテーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| kana_first_name    | string | null: false               |
| kana_last_name     | string | null: false               |
| birthday           | date   | null: false               |


### Association
has_many : items
has_many : buys




## itemsテーブル

| Column             |Type        |Options                         |
|--------------------|------------|--------------------------------|
| item_name          | string     | null: false                    |
| item_more          | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
belongs_to : user
has_one    : buy



## buysテーブル

| Column |Type        | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association
belongs_to : user
belongs_to : item
has_one    : addresses



## addresses

| Column        | Type      | Options                        |
|---------------|-----------|--------------------------------|
| post_code     | string    | null: false                    |
| prefecture_id | integer   | null: false                    |
| city          | string    | null: false                    |
| address       | string    | null: false                    |
| building_name | string    |                                |
| phone_number  | string    | null: false                    |
| buy           | references| null: false, foreign_key: true | 

### Association
belongs_to : buy


id: 'charge-form'