class ChangeTaskNameLimit < ActiveRecord::Migration[5.2]
  def up
    change_column :tasks, :name, :string, limit: 30
  end
  # 反対処理書いておかないと、rollbackしてもそのままlength指定が残ってしまう。。。
  def down
    change_column :tasks, :name, :string
  end
end
