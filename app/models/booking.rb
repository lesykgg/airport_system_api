class Booking < ApplicationRecord
  belongs_to :user, inverse_of: :bookings
  belongs_to :flight, inverse_of: :bookings
end
