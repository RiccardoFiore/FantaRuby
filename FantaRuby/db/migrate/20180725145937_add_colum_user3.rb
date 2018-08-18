class AddColumUser3 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :league_id, :integer
  end
end
