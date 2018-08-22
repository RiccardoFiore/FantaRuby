class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :e, :string
  end
end
