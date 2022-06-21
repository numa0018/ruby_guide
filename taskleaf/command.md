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
- モデル作成
  - bin/rails g model [model name] [attribute:dataType attribute:dataType ....] [option]
    - bin/rails g model Task name:string description:text
- DBのテーブルへのマイグレーション
  - bin/rails db:migrate
- データベース作成
  - bin/rails db:create
- データベース削除
  - bin/rails db:drop
- サーバ起動
  - bin/rails s
- gem更新 (Gemfile書き加えた時)
  - bundle
  - bundle install (bundle と同等)


# slim
ファイル変換
- bundle exec erb2slim [folder or file] --delete
  - bundle exec erb2slim app/views/layouts --delete