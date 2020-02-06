module KubeDSL::DSL::Events
  class EventList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::Events::Event.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "events.k8s.io/v1beta1"
        result[:kind] = "EventList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
