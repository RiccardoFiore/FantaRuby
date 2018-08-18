class DeleteColumnLeague2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :leagues, :status
  end
end
