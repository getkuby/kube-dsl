module KubeDSL::DSL::Events::V1beta1
  class EventSeries
    extend ::KubeDSL::ValueFields

    value_fields :count, :last_observed_time, :state

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :event_series
    end
  end
end
