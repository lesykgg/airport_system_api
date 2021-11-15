class AddSeatNumberToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :seat_number, :integer
  end
end
