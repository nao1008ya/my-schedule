# アプリ名
my-schedule

# アプリケーション概要
スケジュール管理帳です。ユーザー自身のスケジュールの登録、確認ができると共に、グループを作成し、グループメンバーのスケジュールも確認することができます。またグループ内でチャット機能を利用することもできます。
## 利用方法
まずユーザー登録の実施します。
次にスケジュール帳にイベント入力します。
スケジュールのイベントでは編集、削除が可能です。
そしてユーザー内でグループを作成し、グループメンバーのイベント確認も行えます。
グループの編集、削除も可能です。
自身のスケジュールのイベントは編集できますが、他ユーザーのイベントは閲覧しかできない為注意が必要です。
グループ内ではチャット機能を使用してトークを行うことができます。

# URL
https://my-schedule-31053.herokuapp.com/

# テスト用アカウント
Email:test@gmail.com、Password:test0000

# Basic認証
ID: admin、Pass: 2222

# ペルソナ
複数店舗を経営している経営者、店舗責任者、従業員
小規模組織に向けて

# 制作背景(意図)
小規模組織内でスケジュールの管理を簡単に利用できるアプリケーションを開発したいという思いから実装致しました。
前職では24時間365日営業、各店舗1店長という観点からクラウド型グループウェアというサービスを用いて、
スケジュールの登録を実施していました。
実際に用いることで近隣店舗の店長や、上司のスケジュールを把握することができ、仕事面での相談、進捗の確認など
離れているからこそスケジュールの把握が重要だと実感しました。
しかし、クラウド型グループウェアは中堅、大型組織向けのサービスであるため、小規模組織では価格面も踏まえ
あまり導入されていない現状です。
上記内容を踏まえ、小規模組織でも簡単に用いられるスケジュール帳を実装したいと思ったことがきっかけです。

## 洗い出した用件
・ユーザー機能：登録、編集
・イベント機能（simple Calendarを用いたスケジュール機能）：登録、編集、削除
・グループ機能：登録、編集、削除
・チャット機能：送信、受信

# DEMO

## トップページ
![イベント登録](https://user-images.githubusercontent.com/72249406/99342341-027cb280-28cf-11eb-8e9f-4f49f82e465c.gif)
イベントを登録することでスケジュール帳で確認ができます。(カレンダーへはイベントのタイトル名のみ表示されます。)カレンダーのイベントをクリックすると詳細ページへ推移します。詳細ページでは編集、削除などが可能です。なお、ユーザーのイベント情報しか表示されないようになっています。

## 新規登録画面
![新規登録画面](https://user-images.githubusercontent.com/72249406/99337839-6a7acb00-28c6-11eb-97c2-87dbc254ab1f.gif)
![googleアカウントで新規登録](https://user-images.githubusercontent.com/72249406/99340204-e840d580-28ca-11eb-94d7-691b0f7d9b21.gif)
<img width="1077" alt="新規アカウント登録エラーメッセージ" src="https://user-images.githubusercontent.com/72249406/99339736-0823c980-28ca-11eb-9bb6-2526fcd07060.png">
名前、メールアドレス、パスワードを入力することでユーザーの登録をすることができます。googleアカウント外部API(SNSアカウント認証)にて登録することも可能です。入力時にエラーが発生した場合は日本語でエラーメッセージが表示されます。

## グループ機能
![グループ作成](https://user-images.githubusercontent.com/72249406/99343091-8c794b00-28d0-11eb-9ff7-26f9483f0564.gif)
![グループ一覧](https://user-images.githubusercontent.com/72249406/99343431-39ec5e80-28d1-11eb-87a7-9d74e870abe2.gif)
![グループ詳細](https://user-images.githubusercontent.com/72249406/99343648-a49d9a00-28d1-11eb-9d4c-0e2a7ddb49e0.gif)
グループ機能を用いることでグループのユーザーのスケジュールを確認することが可能となります。また、グループ編集、削除機能も実装しています。ページ推移に応じてのパンくず機能も実装しています。

# 工夫した機能
・simple calendar Gemを用いた際にviewファイルへの表示やCSSの編集しました。
・errorメッセージの日本語表記の為にrails-i18n Gemを導入しました。
・パンクず機能の実装の為にgretel Gemを導入しました。
・外部APIの設定(SNSアカウント認証)(google)の設定をしました。
・Java Scriptを用いてグループ間でのチャット機能を実装しました。

# ローカルでの動作方法
rails _6.0.0_

# 使用技術(開発環境)

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
HTML/CSS, Java Script

## データベース
MySQL,SequelPro

## インフラ
Heroku

## Webサーバー(本番環境)
Heroku

## アプリケーションサーバー

## ソース管理
GitHub,GitHubDesktop

##　テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
小規模組織に向けた簡単、
且つ効率的にスケジュールの管理を行う機能の導入が必要と考えました。
その為、シンプルに拘って作成しましたが、グループ間のスケジュール表示では
まとめて表示されず、各ユーザーのスケジュール画面が別々に表示されてしまいました。
チャット機能実装面でも、画像の投稿機能や、グループ内のユーザー個別のトーク機能の実装も課題でございます。

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

## chat テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | string     |                                |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user