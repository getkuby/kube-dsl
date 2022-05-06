# typed: true

module KubeDSL
  module DSL
    module V1
      class Event < ::KubeDSL::DSLObject
        value_field :action
        value_field :count
        value_field :event_time
        value_field :first_timestamp
        object_field(:involved_object) { KubeDSL::DSL::V1::ObjectReference.new }
        value_field :last_timestamp
        value_field :message
        object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
        value_field :reason
        object_field(:related) { KubeDSL::DSL::V1::ObjectReference.new }
        value_field :reporting_component
        value_field :reporting_instance
        object_field(:series) { KubeDSL::DSL::V1::EventSeries.new }
        object_field(:source) { KubeDSL::DSL::V1::EventSource.new }
        value_field :type

        validates :action, field: { format: :string }, presence: false
        validates :count, field: { format: :integer }, presence: false
        validates :event_time, field: { format: :string }, presence: false
        validates :first_timestamp, field: { format: :string }, presence: false
        validates :involved_object, object: { kind_of: KubeDSL::DSL::V1::ObjectReference }
        validates :last_timestamp, field: { format: :string }, presence: false
        validates :message, field: { format: :string }, presence: false
        validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
        validates :reason, field: { format: :string }, presence: false
        validates :related, object: { kind_of: KubeDSL::DSL::V1::ObjectReference }
        validates :reporting_component, field: { format: :string }, presence: false
        validates :reporting_instance, field: { format: :string }, presence: false
        validates :series, object: { kind_of: KubeDSL::DSL::V1::EventSeries }
        validates :source, object: { kind_of: KubeDSL::DSL::V1::EventSource }
        validates :type, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:action] = action
            result[:apiVersion] = "v1"
            result[:count] = count
            result[:eventTime] = event_time
            result[:firstTimestamp] = first_timestamp
            result[:involvedObject] = involved_object.serialize
            result[:kind] = "Event"
            result[:lastTimestamp] = last_timestamp
            result[:message] = message
            result[:metadata] = metadata.serialize
            result[:reason] = reason
            result[:related] = related.serialize
            result[:reportingComponent] = reporting_component
            result[:reportingInstance] = reporting_instance
            result[:series] = series.serialize
            result[:source] = source.serialize
            result[:type] = type
          end
        end

        def kind_sym
          :event
        end
      end
    end
  end
end