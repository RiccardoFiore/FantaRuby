class AddCurrentDayToLeague < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :current_day, :integer
  end
end
