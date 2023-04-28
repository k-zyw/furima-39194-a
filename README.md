# README

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

* ...

## DB設計

## users(出品・購入管理機能)テーブル

|Column               |Type    |Options                    |
|-------------------- |------- |-------------------------- |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| nick_name           | string | null: false               |
| last_name         | string | null: false               |
| first_name          | string | null: false               |
| last_name_kana    | string | null: false               |
| first_name_kana     | string | null: false               |
| birth_day           | date   | null: false               |


### Association
has_many     :items
has_many     :buyers


## items(商品出品)テーブル

|Column                |Type        |Options                         |
|--------------------  |----------- |--------------------------------|
| product_name         | string     | null: false                    |(商品名)
| price                | integer    | null: false                    |(価格)
| description          | text       | null: false                    |(説明)
| category_id          | integer    | null: false                    |(商品詳細)
| product_condition_id | integer    | null: false                    |(商品状態)
| cost_id              | integer    | null: false                    |(配送料)
| shipping_day_id      | integer    | null: false                    |(購入日)
| prefecture_id        | integer    | null: false                    |(都道府県)
| user                 | references | null: false, foreign_key: true |


### Association
belongs_to :user
has_one    :buyer


## buyers(購入者)テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


### Association
has_one    :address
belongs_to :item
belongs_to :user


## addresses(購入記録)テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_cord          | string     | null: false,                   |(郵便番号)
| prefecture_id      | integer    | null: false                    |(都道府県)
| city               | string     | null: false                    |(市)
| address            | string     | null: false                    |(住所)
| building_name      | string     |                                |(ビル名)
| phone_number       | string     | null: false,                   |(電話番号)
| buyer              | references | null: false, foreign_key: true |


### Association
belongs_to  :buyer

