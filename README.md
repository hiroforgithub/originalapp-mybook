

# アプリケーション概要  
 * 本のレビュー投稿ができる  
# テスト用アカウント  
## basic認証
* ID:admin
* Pass:2222  
# 利用方法
* トップページにてユーザー新規登録  
* その後、投稿の閲覧、投稿ができる  
# 課題解決 
* 他のユーザーがどんな本を読んでいるか知りたい
* 自分が過去に読んだ本を振り返りたい
* 本だけの投稿でシンプルなものがいい
# 要件 
* ユーザー機能
  * 新規ユーザー登録
  * ログイン/ログアウト
  * ユーザーごとの投稿一覧を表示
* 投稿機能
  * 新規投稿
  * 投稿編集
  * 投稿削除
* カテゴリー
  * トップページにカテゴリー表示
  * カテゴリーごとに投稿一覧表示
* いいね機能
  * 「いいね」,「いいね」取り消し
  * 「いいね」数によるランキング
# ローカル環境での動作確認
## アプリケーションをclone
* 以下のコマンドを実行
* git clone https://github.com/hiroforgithub/originalapp-mybook.git



# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nick_name          | string | null: false               |
| birth_day          | date   | null: false               |

### Association

- has_many :books
- has_many :likes

## books テーブル

| Column           | Type       | Options     |
|------------------|------------|-------------|
| title            | string     | null: false |
| text             | text       | null: false |
| author           | string     | null: false |
| time             | integer    |             |
| url              | string     |             |
| category_id      | integer    | null: false |
| review_id        | integer    | null: false |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :likes

## likes テーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :book

