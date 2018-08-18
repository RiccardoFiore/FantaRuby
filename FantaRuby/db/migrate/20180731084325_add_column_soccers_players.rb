class AddColumnSoccersPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :soccers_players, :daily_score, :integer, default: 0
  end
end
