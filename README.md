## usersテーブル

| Column          | Type   | Options                   |
| --------------- | ------ | --------------------------|
| nickname        | string | null: false               | #ニックネーム
| email           | string | null: false, unique: true | #メールアドレス
| password        | string | null: false               | #パスワード
| last_name       | string | null: false               | #お名前(全角) 苗字
| first_name      | string | null: false               | #お名前(全角) 名前
| last_name_kana  | string | null: false               | #お名前カナ(全角) 苗字
| first_name_kana | string | null: false               | #お名前カナ(全角) 名前
| birthday        | date   | null: false               | #生年月日

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| title          | string     | null: false                    | #商品名
| text           | text       | null: false                    | #商品の説明
| category_id    | integer    | null: false                    | #カテゴリー
| status_id      | integer    | null: false                    | #商品の状態
| shipping_id    | integer    | null: false                    | #配送料の負担
| prefectures_id | integer    | null: false                    | #発送元の地域（都道府県）
| days_id        | integer    | null: false                    | #発送までの日数
| price          | integer    | null: false                    | #価格
| user           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- has_one :shopping_address

## shipping_addressesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    | #郵便番号 ※ハイフンあり
| prefectures_id | integer    | null: false                    | #都道府県
| city           | string     | null: false                    | #市区町村
| address        | string     | null: false                    | #番地
| building_name  | string     | null: false                    | #建物名
| phone_number   | string     | null: false                    | #電話番号 ※ハイフンあり
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :purchase

## purchasesテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| created_at | datetime   | null: false                    |
belongs_to :user
### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address