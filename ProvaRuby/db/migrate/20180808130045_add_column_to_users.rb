class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :twitter_user_token, :string
    add_column :users, :twitter_user_secret, :string
  end
end
