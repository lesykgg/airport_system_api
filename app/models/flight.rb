class Flight < ApplicationRecord
  has_many :bookings, inverse_of: :flight
end
