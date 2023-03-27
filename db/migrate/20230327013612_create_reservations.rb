class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :theater_id
      t.string :status
      t.datetime :start
      t.datetime :end
      t.float :duration
      t.integer :number_guests
      t.string :content_choice

      t.timestamps
    end
  end
end
