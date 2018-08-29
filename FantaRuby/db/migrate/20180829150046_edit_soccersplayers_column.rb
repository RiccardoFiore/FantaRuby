class EditSoccersplayersColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :soccers_players, :daily_score
    add_column :soccers_players, :daily_score, :float, default: 0
  end
end
