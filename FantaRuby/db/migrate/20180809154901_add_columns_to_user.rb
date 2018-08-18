class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :t_provider, :string
    add_column :users, :t_uid, :string
  end
end
