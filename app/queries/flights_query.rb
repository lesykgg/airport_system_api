class FlightsQuery < BaseQuery
  ALLOWED_FILTERS = %i[from destination].freeze

  model :flight
end
