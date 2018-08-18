class CreateRose < ActiveRecord::Migration[5.2]
  def change
    create_table :roses do |t|
        t.integer :player_id            #references to other tables
        t.integer :soccers_player_id    #references to other tables

        t.timestamps
    end
  end
end
