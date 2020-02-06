module KubeDSL::DSL
  class Event
    extend ::KubeDSL::ValueFields

    value_fields :action, :count, :event_time, :first_timestamp, :last_timestamp, :message, :reason, :reporting_component, :reporting_instance, :type
    object_field(:involved_object) { KubeDSL::DSL::ObjectReference.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:related) { KubeDSL::DSL::ObjectReference.new }
    object_field(:series) { KubeDSL::DSL::EventSeries.new }
    object_field(:source) { KubeDSL::DSL::EventSource.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "Event"
        result[:action] = action
        result[:count] = count
        result[:eventTime] = event_time
        result[:firstTimestamp] = first_timestamp
        result[:lastTimestamp] = last_timestamp
        result[:message] = message
        result[:reason] = reason
        result[:reportingComponent] = reporting_component
        result[:reportingInstance] = reporting_instance
        result[:type] = type
        result[:involvedObject] = involved_object.serialize
        result[:metadata] = metadata.serialize
        result[:related] = related.serialize
        result[:series] = series.serialize
        result[:source] = source.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :event
    end
  end
end
