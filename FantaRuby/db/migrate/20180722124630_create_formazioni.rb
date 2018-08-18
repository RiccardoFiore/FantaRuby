class CreateFormazioni < ActiveRecord::Migration[5.2]
  def change
    create_table :formazionis do |t|
        t.integer :player_id            #references to other tables
        t.integer :giornata
        t.integer :soccers_player_id    #references to other tables

        t.timestamp
    end
  end
end
