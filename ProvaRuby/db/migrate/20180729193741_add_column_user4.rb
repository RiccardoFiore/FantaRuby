class AddColumnUser4 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :budget, :integer, default: 500
  end
end
