class AddColumnToLeague < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :votes_day, :integer, default: 0
  end
end
