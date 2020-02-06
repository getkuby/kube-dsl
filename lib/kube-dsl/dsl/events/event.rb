module KubeDSL::DSL::Events
  class Event
    extend ::KubeDSL::ValueFields
    value_fields :action, :deprecated_count, :deprecated_first_timestamp, :deprecated_last_timestamp, :event_time, :note, :reason, :reporting_controller, :reporting_instance, :type
    object_field(:deprecated_source) { KubeDSL::DSL::EventSource.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:regarding) { KubeDSL::DSL::ObjectReference.new }
    object_field(:related) { KubeDSL::DSL::ObjectReference.new }
    object_field(:series) { KubeDSL::DSL::Events::EventSeries.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "events.k8s.io/v1beta1"
        result[:kind] = "Event"
        result[:action] = action
        result[:deprecatedCount] = deprecated_count
        result[:deprecatedFirstTimestamp] = deprecated_first_timestamp
        result[:deprecatedLastTimestamp] = deprecated_last_timestamp
        result[:eventTime] = event_time
        result[:note] = note
        result[:reason] = reason
        result[:reportingController] = reporting_controller
        result[:reportingInstance] = reporting_instance
        result[:type] = type
        result[:deprecatedSource] = deprecated_source.serialize
        result[:metadata] = metadata.serialize
        result[:regarding] = regarding.serialize
        result[:related] = related.serialize
        result[:series] = series.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
