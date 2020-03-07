module KubeDSL::DSL::V1
  class EventList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::V1::Event.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
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
