class AddFlightAndPassengerToBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :flight, null: false, foreign_key: true
    add_reference :bookings, :passenger, null: false, foreign_key: true
  end
end
