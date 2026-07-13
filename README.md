# Student Manager Backend

## 概要
塾講師としての経験をもとに開発した、学習塾向け生徒管理アプリのバックエンドAPIです。
生徒の個人情報・模試結果の管理機能を提供します。

## 機能
- JWT認証(自前実装)
- 生徒情報管理(登録・閲覧)
- 模試結果管理(登録・閲覧・削除)
- ロールベースのアクセス制御(student/teacher)

## 技術スタック
| 技術 | バージョン |
|---|---|
| Ruby | 3.4.9 |
| Rails | 8.1.3 |
| PostgreSQL | 16 |
| Docker | - |

## インフラ
- バックエンド: Railway
- DB: Railway PostgreSQL

## ER図
※ER図を画像で貼り付ける

## ローカル起動方法

### 前提条件
- Ruby 3.4.9
- Docker

### セットアップ

```bash
git clone https://github.com/Atsushi-iwaguchi/student-manager-backend
cd student-manager-backend
bundle install
docker compose up -d
bin/rails db:create db:migrate
bin/rails s
```

## API エンドポイント

| メソッド | パス | 説明 |
|---|---|---|
| POST | /api/v1/signup | 新規登録 |
| POST | /api/v1/signin | ログイン |
| GET | /api/v1/students | 全生徒一覧(講師のみ) |
| GET | /api/v1/students/:id | 生徒詳細 |
| GET | /api/v1/students/:student_id/exams | 模試一覧 |
| POST | /api/v1/students/:student_id/exams | 模試登録 |
| GET | /api/v1/students/:student_id/exams/:id | 模試詳細 |
| DELETE | /api/v1/students/:student_id/exams/:id | 模試削除 |
| POST | /api/v1/students/:student_id/exams/:exam_id/exam_results | 成績登録 |
| PATCH | /api/v1/exams/:exam_id/exam_results/:id | 成績更新 |
| DELETE | /api/v1/exams/:exam_id/exam_results/:id | 成績削除 |
