class AddColumnUsers2 < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :roles_mask, :integer, default: 4
  end
end
