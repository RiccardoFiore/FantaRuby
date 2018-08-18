class AddColumnLeague2 < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :status, :string
  end
end
