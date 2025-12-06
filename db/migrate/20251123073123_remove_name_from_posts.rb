class RemoveNameFromPosts < ActiveRecord::Migration[6.1]
  def up
    create_table :posts_new do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :item_name
      t.text :memo
      t.text :content
      t.timestamps
    end

    # データコピー
    execute <<-SQL
      INSERT INTO posts_new (id, user_id, category_id, item_name, memo, content, created_at, updated_at)
      SELECT id, user_id, category_id, item_name, memo, content, created_at, updated_at
      FROM posts;
    SQL

    drop_table :posts
    rename_table :posts_new, :posts
  end

  def down
    # rollback 用に元の posts テーブルを復元
    create_table :posts_old do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name, null: false
      t.string :item_name
      t.text :memo
      t.text :content
      t.timestamps
    end

    execute <<-SQL
      INSERT INTO posts_old (id, user_id, category_id, name, item_name, memo, content, created_at, updated_at)
      SELECT id, user_id, category_id, '', item_name, memo, content, created_at, updated_at
      FROM posts;
    SQL

    drop_table :posts
    rename_table :posts_old, :posts
  end
end

