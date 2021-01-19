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

