module KubeDSL::DSL
  class EventSeries
    extend ::KubeDSL::ValueFields
    value_fields :count, :last_observed_time, :state

    def serialize
      {}.tap do |result|
        result[:count] = count
        result[:lastObservedTime] = last_observed_time
        result[:state] = state
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
