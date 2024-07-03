# アプリ概要
- 自分の思考をメモとしてつぶやき、頭の中を整理し、やることを明確にするアプリです。
- マップ機能やカレンダー機能を利用して、アプリ内で今後の予定、行きたいところを記録して思考整理の補助をします。


# 今後の実装する機能（予定）

- 複数人でチャット形式で会話する機能を加えて
- ルームにパスワードを設定し、ルームに入れるユーザーを制限する機能
- マップで行きたい場所を確認、共有できる機能
- カレンダーで今後の予定をその場でメモ、過去の予定も後から見返せる機能


# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |

### Association

- has_many :rooms
- has_many :ideas

## rooms テーブル

| Column          | Type       | Options     |
| --------------- | ------     | ----------- |
| name            | string     | null: false |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- has_many :ideas


## ideas テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user