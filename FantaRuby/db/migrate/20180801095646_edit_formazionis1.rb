class EditFormazionis1 < ActiveRecord::Migration[5.2]
  def change
    remove_column :leagues, :current_day
    add_column :leagues, :current_day, :integer, default: 1
  end
end
