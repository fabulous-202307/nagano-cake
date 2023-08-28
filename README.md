# NAGANO CAKE(ケーキ屋のECサイト)

## アプリケーション概要
[![Image from Gyazo](https://i.gyazo.com/7f05d7b5fcb50f34186c4d5d9e809179.jpg)](https://gyazo.com/7f05d7b5fcb50f34186c4d5d9e809179)

### 概要

長野県にある洋菓子店「ながのCAKE」様の商品を通販するためのECサイト開発。

### 案件の背景

元々近隣住民が顧客だったが、昨年始めたInatagramから人気となり、全国から注文が来るようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管理機能を含んだ通販サイトを開設しようと思い至った。

### 通販について

* 通販では注文に応じて制作する受注生産型としている。
* 現在通販での注文料は十分に対応可能な量のため、１日の受注量に制限は設けない。
* 送料は１配送につき全国一律８００円
* 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。
* 支払い方法はクレジットカード、銀行振込から選択できる。


## 使用言語

* HTML
* CSS
* SCSS
* Ruby
* JavaScript
* フレームワーク
    - Ruby on Rails

## 使用方法

```bash
$ git clone git@github.com:fabulous-202307/nagano-cake.git
$ cd nagano-cake
$ bundle install
$ rails db:migrate
$ rails db:seed
$ yarn add @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object
$ rails s
```
#### 管理者用アカウント

* **メールアドレス**:
admin@email.com

* **パスワード**:
adminpass

* **管理者用ログインURL**:
/admin/sign_in

#####  顧客側の操作は顧客用のサインアップが必要となります。

* **顧客用サインアップURL**:
/customers/sign_up

## ER図


[![Image from Gyazo](https://i.gyazo.com/093722877206af13900f547309e66b8f.png)](https://gyazo.com/093722877206af13900f547309e66b8f)

## アプリケーション設計書

[![Image from Gyazo](https://i.gyazo.com/2c38c95b817705c5d83e748028b8a799.jpg)](https://gyazo.com/2c38c95b817705c5d83e748028b8a799)

## Gem一覧

[![Image from Gyazo](https://i.gyazo.com/4a038d061cce27578d7e502818086e4a.jpg)](https://gyazo.com/4a038d061cce27578d7e502818086e4a)


## 動作環境

* Railsバージョン : 6.1.7.4

* Rubyバージョン : 3.1.2

* データベース : SQLite3

* OS : Linux

## 開発者

DMM WEB CAMP チームファビュラス
