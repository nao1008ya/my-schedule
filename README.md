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
| start_time | daytetime  |                   |
| end        | daytetime  |                   |
| user       | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :group

## groupsテーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| name   | string     | null: false |
| event  | references | null: false |

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