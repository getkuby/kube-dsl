module KubeDSL::DSL::Events::V1
  class Event < ::KubeDSL::DSLObject
    value_field :action
    value_field :deprecated_count
    value_field :deprecated_first_timestamp
    value_field :deprecated_last_timestamp
    object_field(:deprecated_source) { KubeDSL::DSL::V1::EventSource.new }
    value_field :event_time
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    value_field :note
    value_field :reason
    object_field(:regarding) { KubeDSL::DSL::V1::ObjectReference.new }
    object_field(:related) { KubeDSL::DSL::V1::ObjectReference.new }
    value_field :reporting_controller
    value_field :reporting_instance
    object_field(:series) { KubeDSL::DSL::Events::V1::EventSeries.new }
    value_field :type

    validates :action, field: { format: :string }, presence: false
    validates :deprecated_count, field: { format: :integer }, presence: false
    validates :deprecated_first_timestamp, field: { format: :string }, presence: false
    validates :deprecated_last_timestamp, field: { format: :string }, presence: false
    validates :deprecated_source, object: { kind_of: KubeDSL::DSL::V1::EventSource }
    validates :event_time, field: { format: :string }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :note, field: { format: :string }, presence: false
    validates :reason, field: { format: :string }, presence: false
    validates :regarding, object: { kind_of: KubeDSL::DSL::V1::ObjectReference }
    validates :related, object: { kind_of: KubeDSL::DSL::V1::ObjectReference }
    validates :reporting_controller, field: { format: :string }, presence: false
    validates :reporting_instance, field: { format: :string }, presence: false
    validates :series, object: { kind_of: KubeDSL::DSL::Events::V1::EventSeries }
    validates :type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:action] = action
        result[:apiVersion] = "events.k8s.io/v1"
        result[:deprecatedCount] = deprecated_count
        result[:deprecatedFirstTimestamp] = deprecated_first_timestamp
        result[:deprecatedLastTimestamp] = deprecated_last_timestamp
        result[:deprecatedSource] = deprecated_source.serialize
        result[:eventTime] = event_time
        result[:kind] = "Event"
        result[:metadata] = metadata.serialize
        result[:note] = note
        result[:reason] = reason
        result[:regarding] = regarding.serialize
        result[:related] = related.serialize
        result[:reportingController] = reporting_controller
        result[:reportingInstance] = reporting_instance
        result[:series] = series.serialize
        result[:type] = type
      end
    end

    def kind_sym
      :event
    end
  end
end
