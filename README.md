## users テーブル

| Column              | Type    | Options      |
| ----------          | ------  | -----------  |
| nickname            | string  | null: false  |
| email               | string  | unique: true |
| encrypted_password  | string  | null: false  |
| last_name           | string  | null: false  |
| first_name          | string  | null: false  |
| last_name_frigana   | string  | null: false  |
| first_name_frigana  | string  | null: false  |
| birthday            | date    | null: false  |

- has_many :items
- has_many :purchase_records

## items テーブル

| Column             | Type       | Options     |
| ----------         | ---------  | ----------- |
| title              | string     | null: false |
| explanation        | text       | null: false |
| category_id        | integer    | null: false |
| status_id          | integer    | null: false |
| delivery_charge_id | integer    | null: false |
| shipping_area_id   | integer    | null: false |
| duration_id        | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

- belongs_to :users
- has_one :purchase_records

## purchase_records テーブル

| Column        | Type        | Options                        |
| ----------    | ---------   | -----------                    |
| user          | references  | null: false, foreign_key: true |
| item          | references  | null: false, foreign_key: true |

- belongs_to :items
- belongs_to :users
- has_one :street_address

## street_address テーブル

| Column          | Type       | Options     |
| ----------      | ---------  | ----------- |
| postal_code     | string     | null: false |
| prefectures_id  | integer    | null: false |
| municipality    | string     | null: false |
| address         | string     | null: false |
| building_name   | string     |             |
| phone_number    | integer    | null: false |
| purchase_record | references | null: false, foreign_key: true |

- belongs_to :purchase_record