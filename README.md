# README


# DB設計

## teamsテーブル

|Column|Type|Options|
|------|----|-------|
|team_name|srting|null: false, unique: true|
|team_logo|srting|null: false, unique: true|
|team_color|srting|null: false|

### Association
- has_many :players
- has_many :supporters
- has_many :rooms
- has_many :home_team_matches, class_name: 'Match', foreign_key: 'home_team_id'
- has_many :away_team_matches, class_name: 'Match', foreign_key: 'away_team_id'

## playersテーブル

|Column|Type|Options|
|------|----|-------|
|player_name|string|null: false|
|uniform_number|integer|null: false|
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

## stadiaテーブル

|Column|Type|Options|
|------|----|-------|
|studium_name|string|null: false|
|city|string|null: false|

### Association
- has_many :matches

## matchesテーブル

|Column|Type|Options|
|------|----|-------|
|week|integer|null: false|
|kick_off|datetime|null: false|
|stadium_id|reference|null: false, foreign_key: true|
|home_team_id|reference|null: false, foreign_key: { to_table: :teams }|
|away_team_id|reference|null: false, foreign_key: { to_table: :teams }|
|home_team_score|integer||
|away_team_score|integer||

### Association
- belongs_to :stadium
- has_many :rooms
- belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
- belongs_to :away_team, class_name: 'Team', foreign_key: 'away_team_id'

## roomsテーブル

|Column|Type|Options|
|------|----|-------|
|team_id|integer|null: false, foreign_key: true|
|match_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :match
- belongs_to :team
- has_many :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text||
|image|string||
|supporter_id|integer|null: false, foreign_key: true|
|room_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :supporter
- belongs_to :room


◎READMEに記載する項目
・アプリ名
・概要(このアプリでできることを書いて下さい)
・本番環境(デプロイ先　テストアカウント＆ID)
・制作背景(意図)
　⇒どんな課題や不便なことを解決するためにこのアプリを作ったのか。
・DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
　⇒特に、デプロイがまだできていない場合はDEMOをつけることで見た目を企業側に伝えることができます。
・工夫したポイント
・使用技術(開発環境)
・課題や今後実装したい機能
・DB設計