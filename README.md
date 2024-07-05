# アプリ概要
- 自分の思考をメモとしてつぶやき、頭の中を整理し、やることを明確にするアプリです。
- マップ機能やカレンダー機能を利用して、アプリ内で今後の予定、行きたいところを記録して思考整理の補助をします。(実装中)


# 今後実装したい機能（予定）

- 複数人でチャット形式で会話する機能
- ルームにパスワードを設定し、ルームに入れるユーザーを制限する機能
- マップで行った場所、これから行きたいところを記録する機能
- カレンダーで今後の予定をその場でメモ、過去の予定も後から見返せる機能


# アプリの使い方

- アクセス後、未ログインだとログイン画面が表示されます。左のSign upからユーザー登録します。（Emailは＠が入っていれば適当で大丈夫です）
- ログイン後、左の「ボックスを作成する」からアイデアボックスを作成します。作成したボックスが一覧で表示されるので、思いのままにアイデアをつぶやきます。


# アプリの注意点
- デプロイ環境の仕様上、初回読み込みに時間がかかる場合があります。（少々お待ちいただくとアプリが開きます）


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
