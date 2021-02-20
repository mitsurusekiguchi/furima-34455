# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| ---------------------| ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name_reading    | string | null: false |
| first_name_reading   | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many   :products
- belongs_to :card
- belongs_to :destination

## products テーブル

| Column          | Type     | Options          |
| ----------------| ------   | -----------------|
| name            | string   | null: false      |
| description     | string   | null: false      |
| category        | string   | null: false      |
| status          | string   | null: false      |
| shipping_cost   | string   | null: false      |
| shipping_area   | string   | null: false      |
| shipping_days   | string   | null: false      |
| price           | date     | null: false      |
| user            | reference| foreign_key:true |

### Association

- belongs_to :user

## cards テーブル

| Column           | Type       | Options          |
| ---------------- | -----------| -----------------|
| card_number      | string     | null: false      |
| expirations_date | string     | null: false      |
| security_code    | string     | null: false      |
| user             | reference  | foreign_key:true |

### Association

- belongs_to :user

## destination テーブル

| Column        | Type     | Options          |
| --------------| ------   | -----------------|
| post_code     | string   | null: false      |
| prefectures   | string   | null: false      |
| city          | string   | null: false      |
| address       | string   | null: false      |
| building_name | string   |                  |
| phone_number  | string   | null: false      | 
| user          | reference| foreign_key:true |
 
### Association

- belongs_to :user

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
