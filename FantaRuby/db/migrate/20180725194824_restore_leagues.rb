class RestoreLeagues < ActiveRecord::Migration[5.2]
  def change
    remove_column :leagues, :numplayers
    add_column :leagues, :players, :integer
  end
end
