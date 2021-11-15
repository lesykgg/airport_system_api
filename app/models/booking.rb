class Booking < ApplicationRecord
  belongs_to :user, inverse_of: :bookings
  belongs_to :flight, inverse_of: :bookings

  validates_uniqueness_of :seat_number, scope: :flight_id
end
