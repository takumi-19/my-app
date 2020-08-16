![sss](./app/assets/images/sss_banner.png)

# 📘 概要

<p align="center">
  S.S.S.は、日本サッカーを愛する全てのサポーターのためのチャットアプリケーションです。<br>
  トップページにはJ1リーグに所属する各クラブのスタジアムで次に行われる試合が表示されています。<br>
  試合開始時刻より2時間以上前ではボタンが押せず、チャットルームには入れない仕様にしています。
  現実と合わせ、試合開始2時間前の入場開始と同時に、各チームのその試合のチャットルームに入れます。<br>
  自身のアカウントに登録しているお気に入りクラブのルームでは、メッセージを送ることができます。<br>
  送信されたメッセージは、ページの右側のスペースにランダムな文字サイズと速さで流れる様にしています。<br>
  試合を観ながらリアルタイムでサポーター同士が繋がり感情を共有することで、より応援が楽しくなること間違い無しです。<br>
  試合終了後2時間を過ぎるとトップページには次の試合が表示されます。<br>
  過去のチャット履歴は、ヘッダーもしくはフッターのクラブエンブレムをクリックすることで飛べる、<br>
  各クラブの詳細ページのHistoryから閲覧することができます。
</p>

# 📱 本番環境

## URL
<p>
IPアドレス：https://soccer-supporters-stadium.herokuapp.com/<br>
Github：https://github.com/takumi-19/my-app
</p>

## テスト用アカウント

### 管理人アカウント
<p>
メールアドレス：o79.uyama.takumi@gmail.com<br>
パスワード：19191919
</p>

### 一般アカウント
<p>
メールアドレス：ttt@ttt<br>
パスワード：04040404
</p>

# 💭 制作背景

<p>
私は幼少期にサッカーに出会い、小学校1年生から高校3年生までの12年間サッカーをしていました。<br>
今はサッカーの最前線からは退きましたが、趣味程度に友達とボールを蹴っていたり、サッカーを見るのも好きで、<br>
Jリーグや欧州のサッカーリーグの試合は今でも毎日欠かさず見ていたり、スタジアムに観戦しに行ったりもしていました。<br>
しかし、コロナウイルスの世界的大流行により、サッカー界は大きく変わってしまいました。<br>
ウイルスの流行初期には試合の開催を長期間見送り、現在は各国でリーグは再開されたものの、無観客で試合が行われています。<br>
日本のJリーグは先日より、入場者数を制限することでスタジアムにサポーターが帰ってきたが、かなり人数は制限され、<br>
応援などは一切禁止で、ゴールが決まったとしても観客同士でハイタッチも出来ない状況にあります。<br>
また、入場制限によりスタジアムでの観戦が出来なかったサポーターは、もしかしたら家で一人で画面を眺めることしか<br>
出来ないのではないか、という想像も出来ます。<br>
そこで、同じ趣味を持つサッカーファンのために、なんとかして以前の様な楽しい観戦に近付けることは出来ないだろうかと考えました。<br>
このアプリケーションのテーマは、スタジアム観戦の様なワクワクをユーザーに届けることです。<br>
メインとなるチャットページに工夫を施し、自分なりのワクワクを表現して作りました。
</p>

# 🎬 DEMO

# 💥 工夫したポイント

<ul>
  <li>
  シンプルでスタイリッシュな見た目になる様にビューを仕上げました
  </li>
  <li>
  より現実の試合観戦に近付けるために、時間で表示や機能を変更できる様にしました
  </li>
  <li>
  他のチームのサポーターとの問題が起きない様に、お気に入りチーム以外のチャットルームでは閲覧のみになる様にしました
  </li>
  <li>
  テロップには全20種類の効果を設け、より動きのあるチャットルームに仕上げました
  </li>
  <li>
  全体的に初めて使うユーザーに優しい仕様を心がけました
  </li>
</ul>

# 🔧 使用技術(開発環境)

<h3>
Ruby/Ruby on Rails/PostgreSQL/Github/Heroku/Visual Studio Code
</h3>

# 📝 課題や今後実装したい機能

<p>
スタジアムへの入場制限を設けたことで、サッカークラブの収入は大きく低下してしまっています。<br>
そこで、投げ銭を使ってサポーターから応援してもらうことで、クラブの新たな収入源と慣れる様な機能を実装出来たらと考えています。
</p>

# 💻 DB設計

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