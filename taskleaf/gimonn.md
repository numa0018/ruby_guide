# 疑問

## create action　が反応する理由。
p106. 「登録する」押すと、action createが反応するのは何故か？controllerにも定義していない.  
(routesでresourcesは設定した(pathはある状態))
該当のソースが見つけられない。

```new.html.slim
= form_with model: @task, local: true do |f|
  .form-group
    = f.label :name
    = f.text_field :name, class: 'form-control', id: 'task_name'
  .form-group
    = f.label :description
    = f.text_area :description, rows: 5, class: 'form-control', id: 'task_description'
  = f.submit nil, class: 'btn btn-primary'
```

```tasks_controller.rb
class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end
end
```

![画像](./gazou_1.png)

## Migrations are pending. To resolve this issue, run: bin/rails db:migrate RAILS_ENV=development
migrationのバージョンを戻した場合に出た。
bin/rails db:rollback して、マイグレーションファイルを消さなかったのが理由ぽい。

それに付随して、一旦nilで登録してから、not_nullの制約を追加しようとmigrate適用しようとするとエラーになる
該当のデータを消した後にmigrateすれば大丈夫。

```
== 20220623114338 ChangeTasksNameNotNull: migrating ===========================
-- change_column_null(:tasks, :name, false)
rails aborted!
StandardError: An error has occurred, this and all later migrations canceled:

PG::NotNullViolation: ERROR:  column "name" of relation "tasks" contains null values
: ALTER TABLE "tasks" ALTER COLUMN "name" SET NOT NULL
/Users/mitsuhito/ruby_guide/taskleaf/db/migrate/20220623114338_change_tasks_name_not_null.rb:3:in `change'
/Users/mitsuhito/ruby_guide/taskleaf/bin/rails:9:in `<top (required)>'
/Users/mitsuhito/ruby_guide/taskleaf/bin/spring:15:in `<top (required)>'
bin/rails:3:in `load'
bin/rails:3:in `<main>'

Caused by:
ActiveRecord::NotNullViolation: PG::NotNullViolation: ERROR:  column "name" of relation "tasks" contains null values
: ALTER TABLE "tasks" ALTER COLUMN "name" SET NOT NULL
/Users/mitsuhito/ruby_guide/taskleaf/db/migrate/20220623114338_change_tasks_name_not_null.rb:3:in `change'
/Users/mitsuhito/ruby_guide/taskleaf/bin/rails:9:in `<top (required)>'
/Users/mitsuhito/ruby_guide/taskleaf/bin/spring:15:in `<top (required)>'
bin/rails:3:in `load'
bin/rails:3:in `<main>'

Caused by:
PG::NotNullViolation: ERROR:  column "name" of relation "tasks" contains null values
/Users/mitsuhito/ruby_guide/taskleaf/db/migrate/20220623114338_change_tasks_name_not_null.rb:3:in `change'
/Users/mitsuhito/ruby_guide/taskleaf/bin/rails:9:in `<top (required)>'
/Users/mitsuhito/ruby_guide/taskleaf/bin/spring:15:in `<top (required)>'
bin/rails:3:in `load'
bin/rails:3:in `<main>'
Tasks: TOP => db:migrate
(See full trace by running task with --trace)
```

