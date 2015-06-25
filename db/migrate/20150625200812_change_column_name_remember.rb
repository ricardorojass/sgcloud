class ChangeColumnNameRemember < ActiveRecord::Migration
  def change
    rename_column :users, :remember_digest, :remember_token
    add_index :users, :remember_token
  end
end
