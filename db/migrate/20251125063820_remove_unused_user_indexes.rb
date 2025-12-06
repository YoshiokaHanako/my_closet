class RemoveUnusedUserIndexes < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, :confirmation_token if index_exists?(:users, :confirmation_token)
    remove_index :users, :reset_password_token if index_exists?(:users, :reset_password_token)
  end
end