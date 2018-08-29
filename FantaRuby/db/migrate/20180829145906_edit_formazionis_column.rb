class EditFormazionisColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :formazionis, :punteggio
    add_column :formazionis, :punteggio, :float, default: 0
  end
end
