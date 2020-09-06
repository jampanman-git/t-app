# README

# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false, length: { maximum: 6},uniqueness: true |
| password    | string | null: false |
| email       | string | null: false,unique: true |
| image       | text   |             |

### Association
- has_many :trainings


## trainings テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| arm          | integer    | null: false |
| spine        | integer    | null: false |
| abs          | integer    | null: false |
| legs         | integer    | null: false |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## follows テーブル

| Column        | Type       | Options     |
| ------------- | -------    | ----------- |
| followable_id | integer    | null: false |
| follower_id   | integer    | null: false |

