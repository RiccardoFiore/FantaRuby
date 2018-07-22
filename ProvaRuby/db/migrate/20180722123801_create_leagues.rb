class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
        t.string :name         #primary key
        t.text :description
        t.integer :status

        t.integer :player_id        #references to other tables
        t.integer :president_id     #references to other tables

        t.timestamps
    end
  end
end
