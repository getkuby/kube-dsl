module KubeDSL::DSL::Events::V1beta1
  class EventList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Events::V1beta1::Event.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "events.k8s.io/v1beta1"
        result[:kind] = "EventList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :event_list
    end
  end
end
