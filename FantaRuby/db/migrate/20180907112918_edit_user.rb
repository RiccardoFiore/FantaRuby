class EditUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :budget
    add_column :users, :budget, :integer, default: 250
  end
end
