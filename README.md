# README

## 目的
- 自動車販売店が活用する想定でこのアプリケーションを作りました
- 店舗側とユーザー側とで円滑に車検、点検などのやりとりを進めるためのツールです


## できること

### 店舗側
- 担当しているエンドユーザーの検索、情報編集などの管理
- 車両毎のイベント（車検や点検など）の作成
- イベントごとのメッセージ機能
### ユーザー側

- イベントの依頼
- イベントごとのメッセージ機能


## アカウント

### 店舗側
- Eメールアドレス：admin@admin
- パスワード：adminadmin

### ユーザー側
- Eメールアドレス：user@user
- パスワード：useruser


## 使い方

### 店舗側
- トップページ左上でログイン中のユーザーに紐づいたユーザーを検索できたり、ユーザーを新規追加・編集できます
- トップページ右上が日付順のイベント一覧です
- トップページ左下がユーザー個人の情報がみれます
- トップページ右下がイベントに対するメッセージ画面です
<img width="1440" alt="スクリーンショット 2020-03-08 23 46 28" src="https://user-images.githubusercontent.com/59650988/76165115-bef67400-6197-11ea-8d42-1bcd1c07f74a.png">

### ユーザー側
- トップページ右上が保有車両一覧です
- トップページ左下が日付順のイベント一覧です
- トップページ右下がメッセージ送信画面です
<img width="1440" alt="スクリーンショット 2020-03-08 23 52 38" src="https://user-images.githubusercontent.com/59650988/76165146-03820f80-6198-11ea-9027-41c1129d8192.png">

## 実装した機能

- メッセージ自動更新機能
- メッセージ非同期通信
- 管理ユーザーのインクリメンタルサーチ
- 画像保存前プレビュー
- jQueryを用いたビューの表示

## 反省点

- いち画面で機能を完結させることを目指した結果、ファットコントローラーになってしまった
- ユーザー管理の機能に「rails_admin」を用いましたが、カスタム性に乏しく、「active_admin」の方にすればよかったと思いました。



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
