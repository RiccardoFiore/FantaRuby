class UpdateLeagueCurrentDay < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:leagues, :current_day, 1)
  end
end
