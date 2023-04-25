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

## user(出品・購入管理機能)テーブル

|Column               |Type    |Options                    |
|-------------------- |------- |-------------------------- |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| nick_name           | string | null: false               |
| family_name         | string | null: false               |
| first_name          | string | null: false               |
| family_name_kana    | string | null: false               |
| first_name_kana     | string | null: false               |
| birth_day           | date   | null: false               |


### Association
has_many :items
has_one  :buyer


## items(商品出品)テーブル

|Column               |Type        |Options                         |
|-------------------- |----------- |--------------------------------|
| product_name        | string     | null: false                    |(商品名)
| price               | string     | null: false                    |(価格)
| description         | string     | null: false                    |(説明)
| category            | string     | null: false                    |(商品詳細)
| product_condition   | string     | null: false                    |(商品状態)
| cost                | string     | null: false                    |(配送料)
| shipping_from       | string     | null: false                    |(発送元、地域)
| shipping_days       | date       | null: false                    |(購入日)
| user                | references | null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :buyer

## buyer(出品購入)テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_cord          | string     | null: false,                   |(郵便番号)
| prefectures        | text       | null: false                    |(都道府県)
| city               | text       | null: false                    |(市)
| address            | text       | null: false                    |(住所)
| building_name      | string     |                                |(ビル名)
| phone_number       | string     | null: false,                   |(電話番号)
| items              | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |


### Association
has_one  :user
has_many :items
