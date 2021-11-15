class BaseQuery
  class << self
    attr_reader :model_class

    def model(model_name)
      @model_class = model_name.to_s.classify.constantize
    end

    def scope
      raise 'No model defined!' unless model_class

      model_class.all
    end
  end

  attr_reader :params

  def initialize(params)
    @params = params
  end

  def call
    scope = self.class.scope

    params.each_pair do |filter, value|
      next unless self.class::ALLOWED_FILTERS.include?(filter.to_sym)

      next scope = send("by_#{filter}", scope, value) if respond_to?("by_#{filter}")

      scope = scope.where(filter => value)
    end

    scope
  end
end
