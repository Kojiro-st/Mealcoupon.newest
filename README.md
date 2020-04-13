# アプリ名
Mealcoupon

# 概要
地図で住所も検索することができ、クーポンを検索することができるアプリです。

# 使用技術
記事投稿機能
管理ユーザーログイン機能
管理ユーザー登録機能
ページネーション機能
記事一覧表示機能
記事検索機能
記事詳細表示機能
画像ファイルのアップロード機能

開発環境：VS code

# 本番環境
デプロイ先：52.192.64.161
テスト用名前：
テスト用メールアドレス：

# 製作背景(意図)
私は昨年度、3月に大学を卒業してからオーストラリアに留学していました。留学中に日本にはないたくさんのアプリを使うことになりました。Uber、Uber Eats、Airbnbが頻繁に使われているのを目にしました。留学中、宅配のサービスはあっても、帰り道に寄り道して自分の注文した品をすぐに受け取れるようなサービスはあまり発達していないと感じました。そのため、私はこのアプリでどんな品がどこにあり、どんなサービスが提供されているのかを知るアプリを作りたいと感じ、このアプリを制作しようと考えました。

# DEMO
トップページ


記事検索機能

# 工夫したポイント
Google APIを用いた地図による住所検索

# 課題や今後実装したい機能
単体テスト機能
メールによる注文機能
統合テスト機能
タグ検索機能
JavaScript、jQueryによる要素の動かし
Dockerの導入

# DB設計
## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|unique: true, null: false|
|password|string|null: false|

## Association
has_many :posts

## postテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|couponcode|string|null: false|
|shopname|string|null: false|
|address|string|null: false|
|expirydate|string|null: false|
|user_id|integer||

## Association
belongs_to : user
