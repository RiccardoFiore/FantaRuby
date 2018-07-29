class UpdateUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:users, :roles_mask, 1)
  end
end
