## users テーブル

| Column     | Type    | Options      |
| ---------- | ------  | -----------  |
| name       | string  | null: false  |
| email      | string  | unique: true |
| password   | string  | null: false  |
| real_name  | string  | null: false  |
| frigana    | string  | null: false  |
| Birthday   | integer | null: false  |

## items テーブル

| Column          | Type      | Options     |
| ----------      | --------- | ----------- |
| title           | string    | null: false |
| image           |           | null: false |
| explanation     | text      | null: false |
| status          | string    | null: false |
| delivery_charge | string    | null: false |
| shipping_area   | string    | null: false |
| duration        | integer   | null: false |
| price           | integer   | null: false |
| seller          | string    | null: false |

## Purchase_records テーブル

| Column        | Type        | Options                        |
| ----------    | ---------   | -----------                    |
| buyer         | string      | null: false                    |
| purchase_date | integer     | null: false                    |
| title         | references  | null: false, foreign_key: true |

## street_address テーブル

| Column         | Type      | Options     |
| ----------     | --------- | ----------- |
| postal_code    | string    | null: false |
| prefectures    | string    | null: false |
| municipality   | string    | null: false |
| address        | string    | null: false |
| building_name  | string    | null: false |
| phone_number   | integer   | null: false |