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

## matchesテーブル

|Column|Type|Options|
|------|----|-------|
|week|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
|base_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :base
- has_many :match_teams
- has_many :teams through :match_teams

## basesテーブル

|Column|Type|Options|
|------|----|-------|
|studium_name|string|null: false, unique: true|
|city|string|null: false|
|team_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :team
- has_many :matches

## teamsテーブル

|Column|Type|Options|
|------|----|-------|
|team_name|srting|null: false, unique: true|
|base_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :base
- has_many :players
- has_many :supporters
- has_many :comments
- has_many :match_teams
- has_many :matches through :match_teams

## playersテーブル

|Column|Type|Options|
|------|----|-------|
|player_name|string|null: false|
|position|string||
|foot|string||
|height|integer||
|weight|integer||
|team_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :team

## supportersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|avatar_image|string||
|biography|text||
|team_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :team
- has_many :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text||
|image|string||
|supporter_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :supporter
- belongs_to :team

## match_teamsテーブル

|Column|Type|Options|
|------|----|-------|
|match_id|integer|null: false, foreign_key: true|
|team_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :match
- belongs_to :team