class AddColumnLeague < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :players, :integer
  end
end
