class EditSoccerPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :formazionis, :soccers_player_id
    add_column :formazionis, :portiere, :integer
    add_column :formazionis, :difensore1, :integer
    add_column :formazionis, :difensore2, :integer
    add_column :formazionis, :difensore3, :integer
    add_column :formazionis, :centrocampista1, :integer
    add_column :formazionis, :centrocampista2, :integer
    add_column :formazionis, :centrocampista3, :integer
    add_column :formazionis, :centrocampista4, :integer
    add_column :formazionis, :attaccante1, :integer
    add_column :formazionis, :attaccante2, :integer
    add_column :formazionis, :attaccante3, :integer
    add_column :formazionis, :riservapor, :integer
    add_column :formazionis, :riservadif, :integer
    add_column :formazionis, :riservacen, :integer
    add_column :formazionis, :riservaatt, :integer
  end
end
