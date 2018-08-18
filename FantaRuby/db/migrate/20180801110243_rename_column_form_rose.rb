class RenameColumnFormRose < ActiveRecord::Migration[5.2]
  def change
    rename_column :formazionis, :player_id, :user_id
    rename_column :roses, :player_id, :user_id
  end
end
