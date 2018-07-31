class EditRoses < ActiveRecord::Migration[5.2]
  def change
    remove_column :roses, :soccers_player_id
    add_column :roses, :portiere1, :integer
    add_column :roses, :portiere2, :integer
    add_column :roses, :portiere3, :integer
    add_column :roses, :difensore1, :integer
    add_column :roses, :difensore2, :integer
    add_column :roses, :difensore3, :integer
    add_column :roses, :difensore4, :integer
    add_column :roses, :difensore5, :integer
    add_column :roses, :difensore6, :integer
    add_column :roses, :difensore7, :integer
    add_column :roses, :centrocampista1, :integer
    add_column :roses, :centrocampista2, :integer
    add_column :roses, :centrocampista3, :integer
    add_column :roses, :centrocampista4, :integer
    add_column :roses, :centrocampista5, :integer
    add_column :roses, :centrocampista6, :integer
    add_column :roses, :centrocampista7, :integer
    add_column :roses, :centrocampista8, :integer
    add_column :roses, :attaccante1, :integer
    add_column :roses, :attaccante2, :integer
    add_column :roses, :attaccante3, :integer
    add_column :roses, :attaccante4, :integer
    add_column :roses, :attaccante5, :integer
    add_column :roses, :attaccante6, :integer
  end
end
