class RenameTitleToItemNameInPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :title, :item_name
  end
end