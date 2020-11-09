# アプリケーション名
my-schedule

# アプリケーション概要
スケジュール管理帳

# URL
https://my-schedule-31053.herokuapp.com/

# テスト用アカウント
Email:test@gmail.com
Password:test0000

# 利用方法
自身のスケジュールの管理をしつつ、登録しているユーザーでグループを作成し、
グループメンバーのスケジュールを確認することができる。
自身のスケジュールは編集できるが、他ユーザーのスケジュールは閲覧しかできない。

# 目指した課題解決
自身のスケジュール管理が苦手な方から、
会社の部署、大学の部活やサークル、友達同士、家族など
グループでのスケジュール管理を必要とされる方への需要を考慮。

# 洗い出した用件
ユーザー機能：登録、編集
イベント機能（simpleCalendarを用いたスケジュール機能）：登録、編集、削除
グループ機能：登録、編集、削除

# 実装予定の機能
グループ間でのチャット機能

# ローカルでの動作方法
rails _6.0.0_

# データベース設計
ER図
https://gyazo.com/c58d9cd93a494718788333a2761d922e



# テーブル設計
## usersテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |

### Association

- has_many :events
- has_many :groups, through: group_users


## eventsテーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| title      | string     | null: false       |
| content    | text       |                   |
| start_time | daytetime  | null: false       |
| user       | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group

## groupsテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| name   | string     | null: false |

### Association

- has_many :events
- has_many :users, through: group_users

## group_usersテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group