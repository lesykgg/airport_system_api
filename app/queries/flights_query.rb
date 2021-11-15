class FlightsQuery < BaseQuery
  ALLOWED_FILTERS = %i[from destination departure arrival].freeze

  model :flight

  def by_departure(scope, value)
    scope.where("date(departure) = ?", value)
  end

  def by_arrival(scope, value)
    scope.where("date(arrival) = ?", value)
  end
end
