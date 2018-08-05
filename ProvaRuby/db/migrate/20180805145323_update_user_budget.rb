class UpdateUserBudget < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :budget, 300)
  end
end
