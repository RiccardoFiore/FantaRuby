class CreateSoccersPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :soccers_players do |t|
        t.integer :cod
        t.string :cognome
        t.string :ruolo
        t.integer :quotazione

        t.timestamps
    end
  end
end
