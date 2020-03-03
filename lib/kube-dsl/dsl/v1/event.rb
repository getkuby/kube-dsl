module KubeDSL::DSL::V1
  class Event < ::KubeDSL::DSLObject
    value_fields :action, :count, :event_time, :first_timestamp, :last_timestamp, :message, :reason, :reporting_component, :reporting_instance, :type
    object_field(:involved_object) { KubeDSL::DSL::V1::ObjectReference.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:related) { KubeDSL::DSL::V1::ObjectReference.new }
    object_field(:series) { KubeDSL::DSL::V1::EventSeries.new }
    object_field(:source) { KubeDSL::DSL::V1::EventSource.new }

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

    def kind
      :event
    end
  end
end
