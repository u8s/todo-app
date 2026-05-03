# Todo App

Ruby on Rails + Docker で動作する Todo 管理アプリです。アカウント登録・ログインによりユーザーごとに Todo を管理できます。

## 機能

- アカウント登録・ログイン・ログアウト
- Todo の作成・編集・削除
- タイトル・詳細・期限日・タグ・完了フラグの管理
- 完了トグルボタン（一覧画面からワンクリックで完了/未完了を切り替え）
- ユーザーごとのデータ分離

## 技術スタック

- **Ruby on Rails** 7.2
- **SQLite3**
- **Devise**（認証）
- **Bootstrap 5**（UI）
- **Docker / Docker Compose**（開発環境）

## 必要な環境

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## セットアップと起動手順

### 1. リポジトリをクローン

```bash
git clone https://github.com/u8s/todo-app.git
cd todo-app
```

### 2. Docker イメージをビルド

```bash
docker-compose build
```

### 3. データベースを作成・マイグレーション

```bash
docker-compose run --no-deps --rm web rails db:create db:migrate
```

### 4. サーバーを起動

```bash
docker-compose up
```

ブラウザで [http://localhost:3000](http://localhost:3000) にアクセスしてください。

### 5. 停止

```bash
docker-compose down
```

## 開発中の操作

Rails コマンドはすべて `docker-compose run --no-deps --rm web` 経由で実行します。

```bash
# コンソール
docker-compose run --no-deps --rm web rails console

# マイグレーション
docker-compose run --no-deps --rm web rails db:migrate

# テスト
docker-compose run --no-deps --rm web rails test
```
