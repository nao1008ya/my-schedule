# アプリ名
my-schedule

# アプリケーション概要
スケジュール管理帳
## 利用方法
まずユーザー登録の実施します。
次にスケジュール帳にイベント入力します。
スケジュールのイベントでは編集、削除が可能です。
そしてユーザー内でグループを作成し、グループメンバーのイベント確認も行えます。
グループの編集、削除も可能です。
自身のスケジュールのイベントは編集できますが、他ユーザーのイベントは閲覧しかできない為注意が必要です。

# URL
https://my-schedule-31053.herokuapp.com/

# テスト用アカウント
Email:test@gmail.com、Password:test0000

# Basic認証
ID: admin、Pass: 2222

# ペルソナ
複数店舗を経営している経営者、店長、従業員
小規模組織に向けて

# アプリの制作背景
前職では24時間365日営業、各店舗1店長という観点からクラウド型グループウェアというサービスを用いて
スケジュールの登録を実施していました。
実際に用いることで近隣店舗の店長や、上司のスケジュールを把握することができ、仕事面での相談、進捗の確認など
離れているからこそスケジュールの把握が重要だと実感しました。
ですが、クラウド型グループウェアは中堅、大型組織向けのサービスであるため、小規模組織では価格面も踏まえ
あまり導入されていない現状です。
上記内容を踏まえ、小規模組織でも簡単に用いられるスケジュール帳を実装したいと思ったことがきっかけです。

# 課題
小規模組織に向けた簡単、
且つ効率的にスケジュールの管理を行う機能の導入が必要と考えました。
その為、シンプルに拘って作成しました。
その中で自身の登録したスケジュールを把握するためのユーザー機能や
自身のスケジュール、グループメンバー以外のスケジュールを
表示させないためのグループ機能、
グループ間でのスケジュールを踏まえたチャット機能が課題だと考えています。

# 洗い出した用件
・ユーザー機能：登録、編集
・イベント機能（simple Calendarを用いたスケジュール機能）：登録、編集、削除
・グループ機能：登録、編集、削除

# 注力した機能
・simple calendar Gemを用いた際にviewファイルへの表示やCSSの編集
・errorメッセージの日本語表記の為にrails-i18n Gem
・パンクず機能の実装の為にgretel Gem
・外部APIの設定(SNSアカウント認証)(google)

# 実装予定の機能
グループ間でのチャット機能

# ローカルでの動作方法
rails _6.0.0_

# データベース設計
<img width="590" alt="ER図" src="https://user-images.githubusercontent.com/72249406/99138622-4aa09880-2675-11eb-987c-202be8c68548.png">




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