# brew 
- postgresql起動
  - brew service start postgresql

# postgresql
- console
  - psql postgres
- データベース参照
  - psql -l

# rails 
- 新規アプリ作成
  - rails new [app name] -d [database]
    - rails new taskleaf -d postgresql
- データベース作成
  - bin/rails db:create
- データベース削除
  - bin/rails db:drop
- サーバ起動
  - bin/rails s