# brew 
- postgresql起動
  - brew service start postgresql

# postgresql
- console
  - psql postgres
- データベース参照
  - psql -l

# rails 
- Create NewApp
  - rails new [app name] -d [database]
    - rails new taskleaf -d postgresql
- Create Model
  - bin/rails g model [model name] [attribute:dataType attribute:dataType ....] [option]
    - bin/rails g model Task name:string description:text
- Create Controller 
  - bin/rails g controller [controller name] [actionName actionName ....] [option]
    - bin/rails g controller tasks index show new edit
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
- migrationファイルを作成する
  - bin/rails g migration CreateBookstitle:string describe:text
    - bin/rails g migration ChangeTasksNameNotNull
- migration
# slim
ファイル変換
- bundle exec erb2slim [folder or file] --delete
  - bundle exec erb2slim app/views/layouts --delete