class AddColumnToRose < ActiveRecord::Migration[5.2]
  def change
    add_column :roses, :inseriti, :integer, default: 0
  end
end
