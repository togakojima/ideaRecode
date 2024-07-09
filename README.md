# アプリケーション名
### ideaRecode

# アプリ概要
- 自分の思考をメモとしてつぶやき、頭の中を整理し、やることを明確にするアプリです。
- マップ機能やカレンダー機能を利用して、アプリ内で今後の予定、行きたいところなどまとめて記録し振り返ることができます。

# URL
https://idearecode.onrender.com

# テスト用アカウント
- メールアドレス： test@test.com
- パスワード： test12

# アプリの使い方
## - アイデアをつぶやく
- アクセス時、未ログインだとログイン画面が表示されます。左のSign upからユーザー登録できます。（Emailは＠が入っていれば適当で大丈夫です）
- ログイン後、左の「ボックスを作成する」からアイデアボックスを作成します。作成したボックスが一覧で表示されます。
- ボックス内にテキストフォームがあるのでアイデアを入力し保存できます。（削除ボタンを押すと削除されます。）

## - カレンダーで予定の記録
- 上部の「カレンダー」からカレンダーページに遷移します。
- タイトル、内容、時間を記入して保存します。
- 下部にあるカレンダーに保存した予定が記録され、内容を確認できます。内容の編集、削除もできます。

## - マップで行き先を記録
- 上部の「マップ」からマップページに遷移します。
- 「New Map!」から新規登録画面に遷移し、クリックした場所の情報を記録できます。
- 記録した場所はマップページで確認できます。（削除機能を実装予定です。）

# 今後実装したい機能（予定）
- 複数人でチャット形式で会話する機能
- ボックスにパスワードを設定し、ボックスに入れるユーザーを制限する機能

# アプリの注意点
- デプロイ環境の仕様上、初回読み込みに時間がかかる場合があります。（少々お待ちいただくとアプリが開きます）

# なぜこのアプリを作ったのか？
- 現在プログラミング学習を進める中で、今後勉強したいことや、やりたいことが増え、頭の中を整理しなければと思い作成しました。
- また計画的に取り組めるように、アプリ内でカレンダーを実装し簡単に予定を組めるようにしました。
- マップ機能は予定を立てたり、行いを振り返る上で便利だと思い、オマケで付けました。

# データベース設計
![ideaRecode_ER](https://github.com/togakojima/ideaRecode/assets/169892668/70c3600b-c1a4-46cd-8c54-a281ea38f3ac)




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
- has_many :maps
- has_many :calendars

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

## maps テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| latitude  | decimal    | null: false                    |
| longitude | decimal    | null: false                    |
| info      | text       |                                |
| title     | string     | null: false                    |
| user      | references | null: false, foreign_key: true | 

### Association

- belongs_to :user

## calendars テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| content    | text       | null: false                    |
| start_time | datetime   | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user

# 画面遷移図
![ideaRecode_遷移図2](https://github.com/togakojima/ideaRecode/assets/169892668/04f6c4e4-2715-4571-a890-044b300dc3a6)


