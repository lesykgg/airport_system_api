class Flight < ApplicationRecord
  monetize :ticket_price_cents

  has_many :bookings, inverse_of: :flight

  def serializable_hash(*)
    super.merge(available_seats: available_seats)
  end

  def available_seats
    occupated_seats = bookings.pluck(:seat_number).compact

    (1..capacity).to_a - occupated_seats
  end
end
