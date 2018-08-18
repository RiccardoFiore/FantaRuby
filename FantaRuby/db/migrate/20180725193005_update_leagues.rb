class UpdateLeagues < ActiveRecord::Migration[5.2]
  def change
    remove_column :leagues, :players
    add_column :leagues, :numplayers, :integer
  end
end
