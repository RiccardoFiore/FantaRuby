class DeleteColumnUsers3 < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :favourite_team
    add_column :users, :favourite_team, :string
  end
end
