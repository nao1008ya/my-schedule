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
## AWS
http://18.178.157.42/
## Heroku
https://my-schedule-31053.herokuapp.com/

# テスト用アカウント
 - Email:test@gmail.com
 - Password:test0000

# Basic認証
 - ID: admin
 - Pass: 2222

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

## 洗い出した要件
 - ユーザー機能：登録、編集
 - イベント機能（simple Calendarを用いたスケジュール機能）：登録、編集、削除
 - グループ機能：登録、編集、削除
 - チャット機能：送信、受信

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
![グループ作成](https://user-images.githubusercontent.com/72249406/100418712-92d4a780-30c6-11eb-9d1e-2c34131a0e97.gif)
![グループ編集](https://user-images.githubusercontent.com/72249406/100418692-8e0ff380-30c6-11eb-84e1-24e3a44353a2.gif)
![グループ詳細](https://user-images.githubusercontent.com/72249406/99343648-a49d9a00-28d1-11eb-9d4c-0e2a7ddb49e0.gif)
グループ機能を用いることでグループのユーザーのスケジュールを確認することが可能となります。また、グループ編集、削除機能も実装しています。ページ推移に応じてのパンくず機能も実装しています。

## チャット機能
![チャット機能１](https://user-images.githubusercontent.com/72249406/99872217-93cb8c00-2c23-11eb-874b-0f857103ebd9.gif)
![チャット機能２](https://user-images.githubusercontent.com/72249406/99872221-9928d680-2c23-11eb-8df9-96f1cbe4b572.gif)
![チャット機能３](https://user-images.githubusercontent.com/72249406/99872225-9c23c700-2c23-11eb-9862-837bad536649.gif)
グループ間でつけジュールの調整のための、チャット機能を実装致しました。JavaScriptを用いて実装したので、非同期通信です。投稿したユーザーへは右側へ表示、他のユーザーの投稿は左側に表示、グループが違う場合は表示されないようになっています。投稿者、時間も表示してあります。

# 工夫した機能
 - simple calendar Gemを用いた際にviewファイルへの表示やCSSの編集しました。 
 - errorメッセージの日本語表記の為にrails-i18n Gemを導入しました。
 - パンくず機能の実装の為にgretel Gemを導入しました。
 - 外部APIの設定(SNSアカウント認証)(google)の設定をしました。
 - Java Scriptを用いてグループ間でのチャット機能を実装しました。

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
AWS(EC2), Capistrano, Docker(開発環境)

## Webサーバー(本番環境)
nginx

## アプリケーションサーバー
unicorn

## ソース管理
GitHub,GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
小規模組織に向けた簡単、
且つ効率的にスケジュールの管理を行う機能の導入が必要と考えました。
その為、シンプルに拘って作成しましたが、グループ間のスケジュール表示では
まとめて表示されず、各ユーザーのスケジュール画面が別々に表示されてしまいました。
チャット機能実装面でも画像の投稿機能や、グループ内のユーザー個別のトーク機能の実装も課題でございます。

# 画面推移図
<img width="1115" alt="画面推移図" src="https://user-images.githubusercontent.com/72249406/100306379-a0b2fb80-2fe6-11eb-84d5-060dd1ec53ec.png">


# データベース設計
<img width="719" alt="ER図" src="https://user-images.githubusercontent.com/72249406/100042298-847c5680-2e4e-11eb-9061-54ee5bd11a1f.png">

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