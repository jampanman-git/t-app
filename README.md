# README


# アプリ名
Hajime-mascle

# 開発環境
Ruby(2.6.5), Ruby on Rails(6.0.3.2), HTML, CSS, MySQL, Linux, AWS(S3)


# このアプリを通じてできること
・トレーニング記録をつけること
・友人とトレーニングデータを確認し合えること


# 本番環境のアプリURL
https://hajime-mascle-app.herokuapp.com/


# テスト用アカウント
○本人用アカウント
name : test1
email : aaa@gmail.com
PW : aaa111

○フレンド用アカウント
name : test2
email : bbb@gmail.com
PW : bbb222


# 利用方法
主にトレーニングを記録し、またフォローした友人のトレーニングデータを見る。
それにより、モチベーションの維持を促進できる。


# 目指した課題解決
○「運動不足」に対しては以下の問題にアプローチする目的がある。
・社会人であることによる多忙さ
・新型肺炎流行による特段不要な外出の自粛

○「筋トレアプリの始めづらさ」に対しては以下の問題にアプローチする目的がある。
・熟練者向きのアプリが多く、一歩が踏み出せないこと
・モチベーションが続かないこと


# 要件定義
・ユーザー管理機能（新規登録＆ログイン）
・ユーザー情報編集機能
・ユーザー一覧表示機能
・ユーザー検索機能
・トレーニング記録機能
・トレーニングデータのグラフ化機能（自分とフォローしているユーザー分）
・トレーニング後の食事アドバイス表示
・フォロー機能
・フォロー＆フォロワーの一覧表示機能

# 特徴
・ユーザー新規登録フォームは、シンプルにしたかったため記述欄を4項目としたこと
・初心者に近しい人がターゲットであり、煩雑な仕組みは避けたかったためトレーニング記録の部位は「腕筋」、「背筋」、「腹筋」、「脚筋」の4項目としたこと
・トレーニングデータのグラフ化に関しては、本人のものは「本日分の部位ごと」、「過去1週間の部位の比率」、「過去1週間の総回数」、フォローしているユーザーのものは「過去1週間の総回数」をグラフにするように設定したこと


# データベース設計（ER図）
https://app.lucidchart.com/invitations/accept/6c8618d7-b3c4-4a1f-900e-2f6272aad1f2


# ローカルでの動作方法
以下の手順でターミナルにコピー＆ペーストして実行をしてください
① git clone https://github.com/jampanman-git/t-app.git
② cd t-app
③ bundle install
④ rails db:migrate:reset


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

