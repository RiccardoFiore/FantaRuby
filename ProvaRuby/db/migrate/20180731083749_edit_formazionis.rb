class EditFormazionis < ActiveRecord::Migration[5.2]
  def change
    add_column :formazionis, :punteggio, :integer, default: 0
  end
end
