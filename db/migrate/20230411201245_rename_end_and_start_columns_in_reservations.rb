class RenameEndAndStartColumnsInReservations < ActiveRecord::Migration[6.0]
  def change
    rename_column :reservations, :end, :end_time
    rename_column :reservations, :start, :start_time
  end
end
