# テーブル設計

## users テーブル

| Column               | Type   | Options      |
| ---------------------| ------ | -----------  |
| nickname             | string | null: false  |
| email                | string | unique: true |
| encrypted_password   | string | null: false  |
| last_name            | string | null: false  | 
| first_name           | string | null: false  |
| last_name_reading    | string | null: false  |
| first_name_reading   | string | null: false  |
| birthday             | date   | null: false  |

### Association

- has_many   :items
- has_many   :orders


## items テーブル

| Column          | Type     | Options          |
| ----------------| ------   | -----------------|
| name            | string   | null: false      |
| description     | text     | null: false      |
| category_id     | integer  | null: false      |
| status_id       | integer  | null: false      |
| shipping_cost_id| integer  | null: false      |
| shipping_area_id| integer  | null: false      |
| shipping_day_id | integer  | null: false      |
| price           | integer  | null: false      |
| user            | reference| foreign_key:true |

### Association

- belongs_to :user
- has_one   :order

## destination テーブル

| Column         | Type      | Options          |
| -------------- | ------    | -----------------|
| post_code      | string    | null: false      |
|shipping_area_id| integer   | null: false      |
| city           | string    | null: false      |
| address        | string    | null: false      |
| building_name  | string    |                  |
| phone_number   | string    | null: false      | 
| order          | references| foreign_key:true |
 
### Association

- belongs_to :order

## order テーブル

| Column        | Type     | Options          |
| --------------| ------   | -----------------|
| item          | reference| foreign_key:true | 
| user          | reference| foreign_key:true |
| destination   | reference| foreign_key:true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :destination


<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
